#include <stdio.h>

int main(){
    
    printf("Enter a sentence:\n");
    char sen[100];
    scanf("%[^\n]s", sen);
    printf("Output : %s", sen);

    for (int i = 0; i < 100; i++){
        if (sen[i] >= 97 && sen[i] <= 122){ //if lowercase
            sen[i] = sen[i] - 32;   //make uppercase
        }
    }
    printf("UPPER CASE: %s", sen);

    return 0;
}
