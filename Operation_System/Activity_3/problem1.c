#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int compute_period = 5;
int sleep_period = 5;
int i;
/* what to do when alarm is on */
void on_alarm(int signal) {
    printf("Sleep\n");
    sleep(sleep_period);
    printf("Wake up\n");
    /* activate alarm again */
    alarm(compute_period);
}
main(int argc, char* argv[]) {
    int i;
    if (argc != 3) {
        printf("Usage: infinite <compute-period><sleepperiod>\n");
        exit(0);
    } else {
        compute_period = atoi(argv[1]);
        sleep_period = atoi(argv[2]);
    }
    /* on_alarm() is signal handler for SIGALARM */
    signal(SIGALRM, on_alarm);
    /* activate alarm */
    alarm(compute_period);
    /* compute infinitely but can be interrupted by alarm */
    for (i = 0;; i++) {
        if (i == 0) printf("computing\n");
    }
}
