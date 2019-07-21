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
		cout<<"带参构造函数被实现"<<endl;
	}
	CStudent(CStudent&oC)
	{
		name=oC.name;
		number=oC.number;
		cout<<"拷贝构造函数被调用"<<endl;
	}
	~CStudent()
	{
		cout<<"析构函数被调用"<<endl;
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
	cout<<"姓名="<<stu.getName()<<endl;
	cout<<"学号="<<stu.getNumber()<<endl;
}

void main()
{
	CStudent oC("李明",123);
	PrintInfo(oC);
}

