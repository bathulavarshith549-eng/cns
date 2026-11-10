#include <stdio.h>
#define SIZE 5

int stack[SIZE], top = -1;

void push() {
    int x;
    if (top == SIZE - 1)
        printf("Stack Overflow\n");
    else {
        printf("Enter value: ");
        scanf("%d", &x);
        stack[++top] = x;
        printf("Inserted successfully\n");
    }
}

void pop() {
    if (top == -1)
        printf("Stack Underflow\n");
    else
        printf("Deleted element: %d\n", stack[top--]);
}

void display() {
    int i;
    if (top == -1)
        printf("Stack is Empty\n");
    else {
        printf("Stack elements:\n");
        for (i = top; i >= 0; i--)
            printf("%d\n", stack[i]);
    }
}

int main() {
    int ch;

    while (1) {
        printf("\n1.Push  2.Pop  3.Display  4.Exit");
        printf("\nEnter choice: ");
        scanf("%d", &ch);

        switch (ch) {
            case 1: push(); break;
            case 2: pop(); break;
            case 3: display(); break;
            case 4: return 0;
            default: printf("Invalid choice\n");
        }
    }
}