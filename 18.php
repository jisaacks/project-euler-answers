<?php

/**
 * This took me a while to figure out. I was going about it the wrong way at
 * first. I was trying to go through all possible paths one at a time and I
 * couldn't figure a good solution to make sure I went through all the paths
 * possible without going through the same path twice. Then I thought, I
 * should go through all the possible paths concurrently.
 *
 * At the top of the pyramid working your way down you will always have 2
 * adjacent options, below to the left and below to the right. So I split
 * the process everytime trying both left and right recursively until I
 * have reached the bottom of the pyramid, I then take the value and add it
 * to the $ends array as a possible value. Once I have gone through all the
 * possible paths the $ends array will contain all the possible totals for
 * each path. Then to get the highest I just sort the array and grab the last
 * value.
 */

class PyramidMax
{
	// The pyramid of values
	private $pyramid = null;
	
	// Store all the possible outcomes here.
	private $ends = array();
	
	public function __construct($pyramid) 
	{
		$this->pyramid = $pyramid;
	}

	private function get_adjacent($line, $index, $current_value)
	{
		if($line >= count($this->pyramid)-1)
		{
			// Have reached the end of the pyramid
			// add ending value to ends array and exit.
			$this->ends[] = $current_value;
			return;
		}
		
		// There will always be 2 adjacent (left and right)
		
		$adjacent_left = $this->pyramid[$line+1][$index];
		$value_left = $current_value+$adjacent_left;
		$this->get_adjacent($line+1,$index,$value_left);
		
		$adjacent_right = $this->pyramid[$line+1][$index+1];
		$value_right = $current_value+$adjacent_right;
		$this->get_adjacent($line+1,$index+1,$value_right);
	}

	public function max_total()
	{
		// Start by passing in the first (top of pyramid) value
		$this->get_adjacent(0,0,$this->pyramid[0][0]);

		// $ends array now contains all the possible values.
		// Sort the array and grap the last value to get the
		// highest possible outcome.
		sort($this->ends);
		return end($this->ends);
	}
}

$pyramid = array(
	array(75),
	array(95, 64),
	array(17, 47, 82),
	array(18, 35, 87, 10),
	array(20, 04, 82, 47, 65),
	array(19, 01, 23, 75, 03, 34),
	array(88, 02, 77, 73, 07, 63, 67),
	array(99, 65, 04, 28, 06, 16, 70, 92),
	array(41, 41, 26, 56, 83, 40, 80, 70, 33),
	array(41, 48, 72, 33, 47, 32, 37, 16, 94, 29),
	array(53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14),
	array(70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57),
	array(91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48),
	array(63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31),
	array(04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23)
);

$p = new PyramidMax($pyramid);

echo "Maximum total is ".$p->max_total();

?>
