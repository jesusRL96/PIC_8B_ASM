#include<conio.h>
#include<string.h>
#include <math.h> 
#include<stdlib.h>
#include<stdio.h>
#include<fstream>
#include<iostream>
#include<windows.h>
using namespace std;
void lugar (int x, int y)
{
     COORD coord;
     coord.X=x;
     coord.Y=y;
     SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE),coord);
}
void escribir(int x[3], int y[3][2], int z[2], int A[3], int B, long C[3][2]);

int main()
{	
	system("color F9");

	
	int tiempo,Ncm,var1[3]={1,1,1},pred2,var2[3][2]={{1,1},{1,1},{1,1}},pred3,var3[2]={1,1};
	long Ncm1[3][2];
	float frecuencia,Nnops,periodo,cm;
	int minimoS1=11,minimoS2=17,minimoS3=23,subvalida[3]={0,0,0};	
	lugar(12,10);cout<<endl<<"           Tiempo (us):\t\t";
	cin>>tiempo;
	lugar(12,12);cout<<endl<<"           Fosc (MHz):\t\t";
	cin>>frecuencia;
	lugar(12,14);cout<<endl<<"           Numero de Nops:\t";
	cin>>Nnops;
	
	periodo=1/frecuencia;
	cm=4*periodo;
	Ncm=tiempo/cm;
	Ncm1[0][1]=Ncm;
	Ncm1[1][1]=Ncm;
	Ncm1[2][1]=Ncm;
	system("cls");
	for(int i=1;i<=256;i++)
	{
		//subrutina de 1 variable
		if(Ncm>=minimoS1)
		{
			Ncm1[0][0]=floor(5+(i*(Nnops+3)));
			Ncm1[0][0]=Ncm-Ncm1[0][0];
			if(Ncm1[0][0]<=Ncm1[0][1] && Ncm1[0][0]>=0)
			{
				var1[0]=i;
				Ncm1[0][1]=Ncm1[0][0];
			}
			else
			{
				var1[0]=var1[0];
				Ncm1[0][1]=Ncm1[0][1];		
			}
			subvalida[0]=1;
		}
		else
		{
			subvalida[0]=0;
		}
			
		//subrutina de 2 variables
		if(Ncm>=minimoS2)
		{
			pred2=floor((Ncm-7-(4*i))/(i*(Nnops+3)));
			if(pred2<=256 && pred2>=1){var2[0][0]=pred2;}
			else if(pred2>256){var2[0][0]=256;}
			else{var2[0][0]=var2[0][0];}
			
			Ncm1[1][0]=floor(7+(4*i)+(i*var2[0][0]*(Nnops+3)));
			Ncm1[1][0]=Ncm-Ncm1[1][0];
			if(Ncm1[1][0]<=Ncm1[1][1] && Ncm1[1][0]>=0)
			{
				var2[0][1]=var2[0][0];
				var1[1]=i;
				Ncm1[1][1]=Ncm1[1][0];
			}
			else
			{
				var2[0][1]=var2[0][1];
				var1[1]=var1[1];
				Ncm1[1][1]=Ncm1[1][1];		
			}
			subvalida[1]=1;	
		}
		else
		{
			subvalida[1]=0;
		}
		//subrutina de 3 variables
		if(Ncm>=minimoS3)
		{
			for(int j=1;j<=256;j++)
			{
				pred3=floor((Ncm-9-(4*i)-(4*i*j))/(i*j*(Nnops+3)));		
				if(pred3<=256 && pred3>=1){var3[0]=pred3;}
				else if(pred3>256){var3[0]=256;}
				else{var3[0]=var3[0];}
				Ncm1[2][0]=floor(9+(i*j*var3[0]*(Nnops+3))+(4*i)+(4*i*j));
				Ncm1[2][0]=Ncm-Ncm1[2][0];
				if(Ncm1[2][0]<=Ncm1[2][1] && Ncm1[2][0]>=0)
				{
					var3[1]=var3[0];
					var2[1][1]=j;
					var1[2]=i;
					Ncm1[2][1]=Ncm1[2][0];
				}
				else
				{
					var3[1]=var3[1];
					var2[1][1]=var2[1][1];
					var1[2]=var1[2];
					Ncm1[2][1]=Ncm1[2][1];		
				}	
			}
			subvalida[2]=1;
		}
		else
		{
			subvalida[2]=0;
		}	
	}
	/////////////////////////////////////////////////////////////////////////////
	for(int y=0;y<=2;y++)
	{
		if(var1[y]==256){var1[y]=0;}
		if(var2[y][1]==256){var2[y][1]=0;}
		if(var3[1]==256){var3[1]=0;}
	}
	
	system("cls");

	lugar(12,2);cout<<"Ciclos maquina:\t"<<Ncm<<endl;
	if(subvalida[0]==1)
	{
		lugar(12,6);cout<<"SUBRUTINA DE UNA VARIABLE";
		lugar(12,8);cout<<"Valor 1:\t\t"<<var1[0]<<endl;
		lugar(12,9);cout<<"Numero de NOP's':\t"<<Ncm1[0][1]<<endl<<endl;
	}
	else
	{
		lugar(12,4);cout<<"Tiempo muy corto para la subrutina 1"<<endl;
	}

	if(subvalida[1]==1)
	{
		lugar(12,13);cout<<"SUBRUTINA DE DOS VARIABLES";
		lugar(12,15);cout<<"Valor 1:\t\t"<<var1[1]<<endl;
		lugar(12,16);cout<<"Valor 2:\t\t"<<var2[0][1]<<endl;
		lugar(12,17);cout<<"Numero de NOP's':\t"<<Ncm1[1][1]<<endl<<endl;
	}
	else
	{
		lugar(12,6);cout<<"Tiempo muy corto para la subrutina 2"<<endl;
	}
	if(subvalida[2]==1)
	{
		lugar(12,21);cout<<"SUBRUTINA DE TRES VARIABLES";
		lugar(12,23);cout<<"Valor 1:\t\t"<<var1[2]<<endl;
		lugar(12,24);cout<<"Valor 2:\t\t"<<var2[1][1]<<endl;
		lugar(12,25);cout<<"Valor 3:\t\t"<<var3[1]<<endl;
		lugar(12,26);cout<<"Numero de NOP's':\t"<<Ncm1[2][1]<<endl;
	}
	else
	{
		lugar(12,8);cout<<"Tiempo muy corto para la subrutina 3"<<endl;
	}
		
	system("pause>null");
	escribir(var1, var2, var3,subvalida,Ncm,Ncm1);
	return 0;
	exit(0);
}
	////////////////////////////////////////////////////////////
	void escribir(int var1[3], int var2[3][2], int var3[2], int subvalida[3], int Ncm, long Ncm1[3][2])
	{
		system("cls");
		ofstream archivo;
		string nombresubrutina;
		lugar(12,5);cout<<"DIGITE EL NOMBRE DE LA SUBRUTINA: ";
		cin>>nombresubrutina;
		
		archivo.open("codigo.txt",ios::out);
		if(archivo.fail()){cout<<"no se pudo abrir el archivo"; exit(1);}
		
		archivo<<";******numero de ciclos maquina="<<Ncm<<"******"<<endl;
		if(subvalida[0]==1)
		{
			archivo<<";*****subrutina 1 variable******"<<endl;
			archivo<<nombresubrutina.c_str();
			archivo<<"		MOVLW		."<<var1[0]<<endl;
			archivo<<"			MOVWF		0X60"<<endl;
			archivo<<"			CALL		ST1V"<<endl;
			archivo<<"			RETURN"<<endl;
			archivo<<";*****Numero de NOPs="<<Ncm1[0][1]<<"*********"<<endl;
		}
		else
		{
			archivo<<";*****subrutina 1 variable******"<<endl;
			archivo<<"tiempo muy corto para la subrutina de 1 variable"<<endl;
		}
		
		if(subvalida[1]==1)
		{
			archivo<<";*****subrutina 2 variables******"<<endl;
			archivo<<nombresubrutina.c_str();
			archivo<<"		MOVLW		."<<var1[1]<<endl;
			archivo<<"			MOVWF		0X61"<<endl;
			archivo<<"			MOVLW		."<<var2[0][1]<<endl;
			archivo<<"			MOVWF		0X62"<<endl;
			archivo<<"			CALL		ST2V"<<endl;
			archivo<<"			RETURN"<<endl;
			archivo<<";*****Numero de NOPs="<<Ncm1[1][1]<<"*********"<<endl;
		}
		else
		{
			archivo<<";*****subrutina 2 variables******"<<endl;
			archivo<<"tiempo muy corto para la subrutina de 2 variables"<<endl;
		}
	
		if(subvalida[2]==1)
		{
			archivo<<";*****subrutina 3 variables******"<<endl;
			archivo<<nombresubrutina.c_str();
			archivo<<"		MOVLW		."<<var1[2]<<endl;
			archivo<<"			MOVWF		0X64"<<endl;
			archivo<<"			MOVLW		."<<var3[1]<<endl;
			archivo<<"			MOVWF		0X65"<<endl;
			archivo<<"			MOVLW		."<<var2[1][1]<<endl;
			archivo<<"			MOVWF		0X66"<<endl;
			archivo<<"			CALL		ST3V"<<endl;
			archivo<<"			RETURN"<<endl;
			archivo<<";*****Numero de NOPs="<<Ncm1[2][1]<<"*********"<<endl;
		}
		else
		{
			archivo<<";*****subrutina 3 variables******"<<endl;
			archivo<<"tiempo muy corto para la subrutina de 3 variables"<<endl;
		}
		
		archivo.close();
			
	}
	
	
 
