#include <iostream>
#include <locale.h>

using namespace std;

extern "C" {
	unsigned int __stdcall my_proc1(int*,int*, int, int);
}

 int main()
{
	 setlocale(LC_CTYPE, "Russian");
	 int m , n;
	 cout << "Введите количество строк m: ";
	 cin >> m;
	 cout << "Введите количество столбцов n: ";
	 cin >> n;
	 if (m <= 0 || n <= 0 || m*n> 50000) {
		 cout << "Неправильный ввод" << endl;
		 return 0;
	 }
	int matr[50000];// Матрица размером mxn
	int tran[50000]; // Транспонированная матрица
	cout << "Построчно введите матрицу:" << endl;
	
	for (int i = 0; i < n * m; i++) { // Ввод матрицы
		cin >> matr[i];
	}
	
     my_proc1(matr,tran, m, n);

	 cout << endl<<"Транспонированная матрица: "<<endl;
	//Вывод матрицы
	
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			cout << tran[i * m + j] << " ";
		}
		cout << endl;
	}
	system("Pause");
	return 0;
}
