#include"iostream.h"
class CStudent
{
protected:
	char*name;
	int number;
public:
	CStudent(char*n,int num)
	{
		name=n;
        number=num;
		cout<<"���ι��캯����ʵ��"<<endl;
	}
	CStudent(CStudent&oC)
	{
		name=oC.name;
		number=oC.number;
		cout<<"�������캯��������"<<endl;
	}
	~CStudent()
	{
		cout<<"��������������"<<endl;
	}
	char*getName()
	{
		return name;
	}
	int getNumber()
	{
		return number;
	}
};

void PrintInfo(CStudent stu)
{
	cout<<"����="<<stu.getName()<<endl;
	cout<<"ѧ��="<<stu.getNumber()<<endl;
}

void main()
{
	CStudent oC("����",123);
	PrintInfo(oC);
}

