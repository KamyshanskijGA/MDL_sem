  include 'include\win32a.inc'

format MS COFF

public my_proc1 as '_my_proc1@16'

section '.text' code readable executable


proc my_proc1,matr, tran, row ,col
       locals      ;локальные переменные
       .i dd 0      ;сохранение переменной-итератора i внешнего цикла
       .temp dd 0  ;переменная для сохранения значения которое будем помещать в транспонированную матрицу
        endl

       mov ecx, [row]  ;цикл по кол-во строк
m1:
       push ecx          ;сохраняем счетчик

       xor esi, esi     ;обнуляем переменную-итератор j внутреннего цикла
       mov ebx, [row]      ;вычисляем переменную-итератор i
       mov [.i], ebx
       sub [.i], ecx

       mov ecx, [col]     ;внутренний цикл по количеству рядов

m2:

       mov eax,[.i]      ;вычисляем индекс элемента исход. матрицы по формуле i*col+j
       mul [col]
       add eax, esi
       mov ebx, 4       ;домножаем его на 4 для смещения edi
       mul ebx
       mov edi,[matr]     ;передаем указатель на матрицу и смещаем его на индекс
       add edi,eax
       mov ebx, [edi]
       mov [.temp],ebx    ;сохраняем нужное нам значение

       mov eax, esi     ;вычисляем индекс элемента транспонированной матрицы по формуле j*row+i
       mul [row]
       add eax, [.i]
       mov ebx, 4        ;домножаем его на 4 для смещения edi
       mul ebx
       mov edi,[tran]   ;передаем указатель на матрицу и смещаем его на индекс
       add edi, eax
       mov ebx, [.temp]
       mov [edi], ebx     ;помещаем значение в результирующую матрицу

       inc esi             ;увеличиваем переменную-итератор внутреннего цикла

       loop m2
       pop ecx             ;извлекаем счетчик

       loop m1
        ret
 endp

