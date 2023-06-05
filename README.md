# MIPS
MIPS processor project for Computer Architecture CC311 course.
Implementation of single cycle MIPS processor using Xilinx ISE and VHDL.

## MIPS Structure 

![Capture](https://github.com/dinaashraf20003/MIPS/assets/73821958/64911f3c-11d5-4e0d-8374-1d23bb542372)


## Green Sheet

![Capture2](https://github.com/dinaashraf20003/MIPS/assets/73821958/067fc870-ed97-41ca-a735-37de4ed90bee)


# Used Parameters

## Register file:
- $a0 = 5
- $a1 = 7

## Memory file:
- Memory[0]= 0x”ABCDEF00”
- Memory[1]= 0x”75746572”
- Memory[2]= 0x”20417263”
- Memory[3]= 0x”68697465”
- Memory[4] = 0x”12345678”
- Memory[5]= 0x”7F7F6D6D”
- Memory[6]= 0x”00000000”
- Memory[7]= 0x”78786A6A”
- Memory[8]= 0x”00000001”

## Program:
- add $v0, $a0, $a1
- sw $v0, 8($zero)
- lw $a2, 8($zero)
- beq $v0, $a2, Good_Processor
- slt $s1, $v0, $a2
- Good_Processor: sub $s1, $a1, $a0

## Simulation Output

![Capture3](https://github.com/dinaashraf20003/MIPS/assets/73821958/f8abc6ac-2b8b-4646-9ade-2cb1ee9ed063)
![Capture4](https://github.com/dinaashraf20003/MIPS/assets/73821958/85432555-3e82-4a18-b8ab-84b0f6506330)

## Report 
[MIPS Processor Report](https://github.com/dinaashraf20003/MIPS/files/11651537/MIPS.Processor.Report.pdf)
