void int2bitstr(int I, char *str) {
	/* Creates variables needed for this method.
	 * Mask - for storing the result of bitwise operations and testing.
	 * i - a copy of int provided as argument that can be manipulated.
	 * j - to use in the for loop and index value when writing to the str array.
	*/
	int mask, i, j;
	//Creates a copy of int I to preforme bitwise operations on without loosing track of orgininal value.
	i = I;
	//loop itterates through each bit of the provided int and coppies each bit into a char array str.
	for(j =31; j>=0; j--){
		mask = i & 1;
		if(mask == 1){
			str[j] = '1';
		}
		else{
			str[j] = '0';
		}
		i = i >> 1;
	}
	//fill last char in str array with null.
	str[32] = '\0';
}

int get_exp_value(float f) {
	unsigned f2u(float f);
	unsigned int ui = f2u(f);
	//creates a variable for the bias, in 32 bit integers the bias is always 127.
	int bias = 127;
	//left shift by one bit to remove the sign bit.
	ui = ui << 1;
	//right shift by 24 to remove the fib bits.
	ui = ui >> 24;
	//test for denormalized case, where fib bits are all 0s.
	if(ui == 0)
		return 1-bias;
	//test for special values case, where fib bits are all 1s.
	if(ui == 255)
		return -1;
	//since this is not the denormalized case or a special case, compute the E value by subtracting the bias from the unsigned value of the remaining bits.
	else{
		return ui - bias;
	}
}
