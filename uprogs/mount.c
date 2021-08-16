#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"


int main(int argc, char *argv[]) {

	int result = 0;	
	result = mount("/usb");
	printf(1, "mount %s\n", result == 0 ? "SUCCESS" : "FAILURE");
	exit();	
}
