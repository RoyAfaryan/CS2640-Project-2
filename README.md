# Date Checker

This program is a MIPS assembly implementation of a date checker. It prompts the user to enter a date (month, day, and year) and then determines if the year is a leap year or not. Additionally, it outputs the day of the week for the given date.

## Usage

1. Run the program using a MIPS emulator or assembler.

2. Enter the month, day, and year when prompted.

3. View the output, which includes information about the leap year status and the day of the week for the entered date.

## Example Output

Enter the Month? 5
Enter the Day? 22
Enter the Year? 2023

2023 is not a leap year and the date 5/22/2023 is a Monday.

## Additional Information

- The program uses the Zeller's Congruence algorithm to determine the day of the week for a given date.
- It checks if the year is a leap year based on the Gregorian calendar rules.
- The program is implemented in MIPS assembly language.
