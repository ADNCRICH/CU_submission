#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>
int main(int argc, char* const argv[]) {
    pid_t pid;
    pid = fork();
    if (pid < 0) {
        printf("Error : cannot fork\n");
        exit(1);
    } else if (pid == 0) {
        // execvp("cal", av);
        // printf("argc: %d\n", argc);
        // int i = 0;
        // for(i = 0; i < argc; i++)
        //     printf("arg %d: %s\n", i, argv[i]);
        if (argc == 1){
            printf("Please enter UNIX command\n");
            return 0;
        }
        execvp(argv[1], argv+1);
    } else {
        wait(NULL);
        return (0);
    }
}