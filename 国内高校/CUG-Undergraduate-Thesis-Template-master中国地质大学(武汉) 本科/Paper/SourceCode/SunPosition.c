// Sun Position.cpp : �������̨Ӧ�ó������ڵ㡣



//���ź����㷨ֻ�ܾ�ȷ�� 0.0001  �������������޼���





#include "stdafx.h"
#include "stdlib.h"
#include "math.h"

#define pi 3.14159265358979
#define latitude 30.15       //γ��
#define longitude 114.40    //����
#define sunrise 6.0000
#define sundown 20.0000
#define stepinterval 0.3000    //��������
#define firstday 1
#define lastday 365
#define definition 0.0001        //��ȷ��
#define interval 5.0000     //���   ��λ����
#define Nhour 80               //�������
#define Nday 365              //�������������firstday��lastday����һ��

  

double r(int d_,float h_)   //fraction of year in rad
{
	return 2*pi*(d_-1+h_/24)/365; 
}

double decl(int d_,float h_)    //declination of the sun in rad on day d after Jan 1 at h hrs
{
	return 0.006918 - 0.399912*cos(r(d_,h_)) +0.070257*sin(r(d_,h_)) -0.006758*cos(2*r(d_,h_))+0.000907*sin(2*r(d_,h_))-0.002697*cos(3*r(d_,h_)) +0.00148*sin(3*r(d_,h_));
}

double eot(int d_,float h_)     //equation of time in min
{
	return 229.18 *(0.000075 + 0.001868 * cos(r(d_,h_)) - 0.032077 * sin(r(d_,h_)) - 0.014615 * cos(2*r(d_,h_)) - 0.040849 * sin(2*r(d_,h_)));
}


int Round(float x)    //��x��������
{
	if (x<((int)x+0.5))
	{
    	return (int)x;
    }
	else return (int)x+1;
}


double tcf(int d_,float h_,float long_)     //time correction factor in min
{
	return eot(d_,h_) - 4 *long_ + 60 * Round(long_/15);
}


double hra(int d_,float h_,float long_)    //hour angle in rad
{
	return pi*((60*h_ + tcf(d_,h_,long_))/4-180)/180;
}


double alt(int d_,float h_,float lat_,float long_)   //altitude of the sun in degree
{
	return asin( cos(decl(d_,h_)) * cos(lat_*pi/180) * cos(hra(d_,h_,long_))+ sin(decl(d_,h_)) * sin(lat_*pi/180))*180/pi;
}


double az(int d_,float h_,float lat_,float long_)    //azimuth of the sun in degree
{
	double x,y,t;
	x=tan(decl(d_,h_))*cos(lat_*pi/180)-sin(lat_*pi/180)*cos(hra(d_, h_, long_));	
	y=-sin(hra(d_,h_,long_));
	t=atan(y/x)*(180/pi);
	if (x<0&&y>0)          //λ�ڵڶ�����
	{
		t=180+t;		
	}
	else if (x<0&&y<0)       //λ�ڵ�������
	{
		t=180+t;
	}
	else if (x>0&&y<0)       //λ�ڵ�������
	{
		t=360+t;		
	}
	return t;
}
double distance(double alt_,double azi_,double alt0_,double azi0_)       //��������
{
	return fabs(sqrt((alt_-alt0_)*(alt_-alt0_)+(azi_-azi0_)*(azi_-azi0_)));
}


float locate(int d_,float h_0,float dis_)        //���h_��h_0��h_֮��distance����dis_
{	
	int count,polar,polar0,polartemp,n;
	float h_;
	double distemp,alt0_,azi0_,alt_,azi_;

	alt0_=alt(d_,h_0,latitude,longitude);
	azi0_=az(d_,h_0,latitude,longitude);

    h_=h_0+stepinterval;
	polar0=0;
	polar=0;                   //���������ж��Ƿ�ʼ�ƽ�

	for (count=1,n=1;;n++)
	{
		alt_=alt(d_,h_,latitude,longitude);
		azi_=az(d_,h_,latitude,longitude);
		distemp=distance(alt0_,azi0_,alt_,azi_);

		//printf("deviation=%f\n",distemp-dis_);

		if (fabs(distemp-dis_)<definition)  
		{
			break;
		}		
		if (distemp<dis_)
		{
			polartemp=0;
			if (polar0!=polartemp)
			{
				polar=1;				
			}
			if (polar)
			{							
			    h_=h_+stepinterval/count;       //��ʼ�ƽ�
				count++;
			}
			else  h_=h_+stepinterval;            //��������
		}
		else if (distemp>=dis_)
		{
			polartemp=1;
			if (polar0!=polartemp)
			{
				polar=1;
			}
			if (polar)
			{
				h_=h_-stepinterval/count;
				count++;
			}
			else  h_=h_+stepinterval;			
		}
		polar0=polartemp;		
	}
	return h_;
}

int dataformat(float h_)                //���ݸ�ʽ��
{
	int formatmin,formatsec,formatime;

	h_=h_-sunrise;
	h_=h_*60;
	formatmin=(int)h_;
	h_=h_-formatmin;
	h_=h_*60;
	formatsec=Round(h_);

	formatime=formatmin*100+formatsec;

	return formatime;
}
void main()
{
	char c;
	int day,n,i,j,sum=0,stata[Nday];
	double altemp,aztemp;
	float hour,dis_;
	dis_=interval;

	struct  data
	{   
		float time[Nhour];
		double alt;
		double az;
	};

	data mydata[Nday];
	for (i=0;i<Nday;i++)       //��ʼ���ṹ��
	{
		for (j=0;j<Nhour;j++)
		{
			mydata[i].time[j]=0;
		}
	}


	for (day=firstday;day<=lastday;day++)
	{
		for (hour=sunrise,n=0;hour<=sundown;)
		{
			altemp=alt(day,hour,latitude,longitude);
			aztemp=az(day,hour,latitude,longitude);

			if (altemp>0 && aztemp>=0)         //ʹ̫���ڵ�ƽ������
			{
				mydata[day-1].alt=altemp;
				mydata[day-1].az=aztemp;
			}
			else 
			{
				hour=locate(day,hour,dis_);
				continue;
			}

			hour=locate(day,hour,dis_);
			mydata[day-1].time[n]=dataformat(hour);
			
			if (n==Nhour-2)
			{
				printf("Oh  My God!!!");
				scanf("%d",&i); 				
			}
			printf(" n=%2d    hour=%6.3f   day=%3d  \n",n,hour,day);
			n++;
			stata[day-1]=n;
		}
		sum=sum+n;
	}

	printf("\nCaculate Over!!   Sum=%d KB\n\n\n\nWritting in the file.............\n\n",sum*2/1024);

	FILE *fp;	                                //�ļ�д�벿��
	if ((fp=fopen("data.txt","w"))==NULL)
	{
		printf("Cannot open the file!!!\n");
	}

	fputs("\n\n******Generated by Neil******\n",fp);
	fprintf(fp,"\nlatitude=%6.3f\nlongitude=%6.3f\nsunrise=%6.3f\nsundown=%6.3f\nstepinterval=%6.3f\nfirstday=%6d\nlastday=%6d\ndefinition=%6.5f\ninterval=%6.3f\nNday=%6d\n\n",latitude,longitude,sunrise,sundown,stepinterval,firstday,lastday,definition,interval,Nday);         //����궨������ֵ

	for (i=0;i<Nday;i++)
	{
		for (j=0;j<Nhour;j++)
		{
			if (mydata[i].time[j]==0)
			{
				break;
			}
			//fprintf(fp,"day=%3d   number=%2d   hour=%4.0f \n",i+1,j+1,mydata[i].time[j]);
			fprintf(fp,"code unsigned char Timedatas[%d].data[%d]=%4.0f\n",i,j,mydata[i].time[j]);

		}
	}

	for (i=0;i<Nday;i++)
	{		
		fprintf(fp,"day=%3d   %d\n",i+1,stata[i]);
	}

	fputs("\n\n******Generated by Neil******\n",fp);
	fclose(fp);                                                                 //д�����


	printf("Congrutulation  !!!!!!\n\n******Generated by Neil******\n\n");                 //������ִ���˳�����
	printf("All work have been done well!!\n\nYou can Press Enter to close me.\n\n");
	c=getchar();
	if (c==13)
	{
		exit(0);
	}
	else printf("All work have done well!!\nYou can Press Enter to close me.\n");
}

