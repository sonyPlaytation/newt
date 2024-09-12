/// @description scr_after_image()
/// @param length: max sprites in after image
/// @param spacing: steps between update
/// @param fade length: how quicly the after image fades out
/// @param colour: c_white for default
function scr_after_image(argument0, argument1, argument2, argument3) {
	//check to see if trail_x exists VARIABLE INSTANCE EXISTS ONLY WORKS WITH GMS2
	if !variable_instance_exists(id, "trail_x")
	{
		//because we ignore teh 0 position if you enter the number 5 you will have 4 after images
		//whatever number you enter minus 1 from it and that will be the amount you will have as a draw sprite
		number_of_after_images = argument0
		spacing = argument1
		//take care with fade length if your length is slow and you have only 4 images the image that is 4th will not fade out before it is deleted
		//fade_length of 0.05 and number_of_after_images of 5 is a good setting
		fade_length = argument2
		colour = argument3
		//trail_x keeps track of the x position for each position of the array
		//each position of a ds list is a after image
		trail_x = array_create(number_of_after_images, undefined)
		//trail_y keeps track of the y position
		trail_y = array_create(number_of_after_images, undefined)
		//alpha keeps track of t he alpha for each image
		//this will update independitly but will match the array length
		//this means that even if a after image is generated every 4 steps the alpha of each after image is updated every step
		alpha = array_create(number_of_after_images, 1)
		//temp values for array copy later in code
		//we use these with array copy to shift the values down by 1 entry
		temp_x = array_create(number_of_after_images, undefined)
		temp_y = array_create(number_of_after_images, undefined)
		temp_alpha = array_create(number_of_after_images, undefined)
	}
	if argument2 == undefined
	{
		argument2 = c_white
	}
	//draw the after image trail with for loop
	//Start i at 1 as the math for the after image length would equal 0 if we start i at 0
	//that means we are not drawing the first entry of the array as its alpha would be 0
	//1 through whatever the argument number is is all that is drawn
	for(var i=1; i<number_of_after_images; i++)
	{
		//dont draw directly beneacth us if we are not moving
		if trail_x[i] != x || trail_y[i] != y
		{
			//make sure the entry has a value
		    if trail_x[i] != undefined
		    {
			    //draw sprite for each psoition in the array
			    draw_sprite_ext(sprite_index, image_index, trail_x[i], trail_y[i], 1, 1, image_angle, colour, alpha[i])
		    }
		}
	}
	//Update alpha values every step for each array entry
	for (var i = 1; i<number_of_after_images; i++)
	{
		//make sure the array entry contains a value
		if alpha[i] != undefined
		{
	    alpha[i] = alpha[i] - fade_length
		}
	}
	
	//This is our spacing
	//If spacing is == 0 then we update a new x and y position to the ds list and set spacing back to the value provided in the argument
	if spacing <= 0
	{
		//add x and y to ds list
		trail_x[number_of_after_images] = x
		trail_y[number_of_after_images] = y
		alpha[number_of_after_images] = 1
		//set spacing to argument
		spacing = argument1
		//update the information contained in the arrays
		//shift the information down by 1
		//on the next update position 4 will be position 3 and so on.
		array_copy(temp_x, 0, trail_x, 1, array_length_1d(trail_x))
		array_copy(trail_x, 0, temp_x, 0, array_length_1d(temp_x))
		array_copy(temp_y, 0, trail_y, 1, array_length_1d(trail_y))
		array_copy(trail_y, 0, temp_y, 0, array_length_1d(temp_y))
		array_copy(temp_alpha, 0, alpha, 1, array_length_1d(alpha))
		array_copy(alpha, 0, temp_alpha, 0, array_length_1d(temp_alpha))

	}
	//minus one from spacing
	else
	{
		spacing --
	}


}
