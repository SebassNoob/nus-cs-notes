= Excel Functions Reference

== Statistical Functions

=== AVERAGE()
*Arguments:* `number1, number2, ...` (numbers or ranges)

*Returns:* Number

*Description:* Calculates the arithmetic mean of a set of values. Ignores text, logical values, and empty cells.

*Example:* `=AVERAGE(A1:A10)` returns the mean of values in cells A1 through A10.

---

=== MEDIAN()
*Arguments:* `number1, number2, ...` (numbers or ranges)

*Returns:* Number

*Description:* Returns the middle value in a dataset when sorted. If the dataset has an even number of values, returns the average of the two middle values.

*Example:* `=MEDIAN(B1:B20)` returns the median value from the range B1 to B20.

---

=== MODE()
*Arguments:* `number1, number2, ...` (numbers or ranges)

*Returns:* Number

*Description:* Returns the most frequently occurring value in a dataset. Returns \#N/A error if no value appears more than once.

*Example:* `=MODE(C1:C15)` finds the most common value in the range.

---

=== STDEV.S()
*Arguments:* `number1, number2, ...` (numbers or ranges)

*Returns:* Number

*Description:* Calculates the sample standard deviation, which estimates the standard deviation based on a sample of the population. Uses the "n-1" method.

*Example:* `=STDEV.S(D1:D50)` calculates sample standard deviation for the dataset.

---

=== MAX()
*Arguments:* `number1, number2, ...` (numbers or ranges)

*Returns:* Number

*Description:* Returns the largest value in a set of values. Ignores text and logical values.

*Example:* `=MAX(E1:E100)` finds the maximum value in the range.

---

=== MIN()
*Arguments:* `number1, number2, ...` (numbers or ranges)

*Returns:* Number

*Description:* Returns the smallest value in a set of values. Ignores text and logical values.

*Example:* `=MIN(F1:F100)` finds the minimum value in the range.

---

=== CORREL()
*Arguments:* `array1` (range), `array2` (range)

*Returns:* Number (between -1 and 1)

*Description:* Calculates the Pearson correlation coefficient between two datasets, measuring the strength and direction of the linear relationship between them.

*Example:* 
```excel
=CORREL(A1:A20, B1:B20)
```
Returns the correlation between two variables. A value of 1 indicates perfect positive correlation, -1 indicates perfect negative correlation, and 0 indicates no linear correlation.

---

=== SLOPE()
*Arguments:* `known_y's` (range), `known_x's` (range)

*Returns:* Number

*Description:* Calculates the slope of the linear regression line through the given data points using least squares method. Returns the rate of change of y with respect to x.

*Example:*
```excel
=SLOPE(B2:B15, A2:A15)
```
If A2:A15 contains years and B2:B15 contains sales figures, this returns the annual rate of change in sales. For instance, a result of 5000 means sales increase by 5,000 per year on average.

---

=== CONFIDENCE.T()
*Arguments:* `alpha` (number), `standard_dev` (number), `size` (number)

*Returns:* Number

*Description:* Calculates the confidence interval using Student's t-distribution. Used when sample size is small or population standard deviation is unknown. Returns the margin of error value.

*Example:*
```excel
=CONFIDENCE.T(0.05, 2.5, 30)
```
Calculates the 95% confidence interval (alpha=0.05) for a sample with standard deviation 2.5 and sample size 30. If the sample mean is 50, the confidence interval would be 50 ± result.

---

=== COUNT()
*Arguments:* `value1, value2, ...` (values or ranges)

*Returns:* Number (integer)

*Description:* Counts the number of cells containing numeric values. Ignores empty cells, text, logical values, and errors.

*Example:* `=COUNT(A1:A100)` returns how many cells in the range contain numbers.


