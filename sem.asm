  include 'include\win32a.inc'

format MS COFF

public my_proc1 as '_my_proc1@16'

section '.text' code readable executable


proc my_proc1,matr, tran, row ,col
       locals      ;��������� ����������
       .i dd 0      ;���������� ����������-��������� i �������� �����
       .temp dd 0  ;���������� ��� ���������� �������� ������� ����� �������� � ����������������� �������
        endl

       mov ecx, [row]  ;���� �� ���-�� �����
m1:
       push ecx          ;��������� �������

       xor esi, esi     ;�������� ����������-�������� j ����������� �����
       mov ebx, [row]      ;��������� ����������-�������� i
       mov [.i], ebx
       sub [.i], ecx

       mov ecx, [col]     ;���������� ���� �� ���������� �����

m2:

       mov eax,[.i]      ;��������� ������ �������� �����. ������� �� ������� i*col+j
       mul [col]
       add eax, esi
       mov ebx, 4       ;��������� ��� �� 4 ��� �������� edi
       mul ebx
       mov edi,[matr]     ;�������� ��������� �� ������� � ������� ��� �� ������
       add edi,eax
       mov ebx, [edi]
       mov [.temp],ebx    ;��������� ������ ��� ��������

       mov eax, esi     ;��������� ������ �������� ����������������� ������� �� ������� j*row+i
       mul [row]
       add eax, [.i]
       mov ebx, 4        ;��������� ��� �� 4 ��� �������� edi
       mul ebx
       mov edi,[tran]   ;�������� ��������� �� ������� � ������� ��� �� ������
       add edi, eax
       mov ebx, [.temp]
       mov [edi], ebx     ;�������� �������� � �������������� �������

       inc esi             ;����������� ����������-�������� ����������� �����

       loop m2
       pop ecx             ;��������� �������

       loop m1
        ret
 endp

