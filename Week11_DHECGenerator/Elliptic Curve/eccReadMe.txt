ECC MATLAB Function Explanation:

1. Function Definition:
   - The function is named 'ECC' and doesn't take any input parameters. It is designed to plot an elliptic curve over real numbers.

2. Setting Curve Parameters:
   - 'a' and 'b' are coefficients of the elliptic curve equation y^2 = x^3 + ax + b. In this case, 'a' is set to -1 and 'b' to 1.

3. Defining the Range of x Values:
   - A range of x values is defined using linspace(-5, 5, 1000). This creates a vector of 1000 evenly spaced points between -5 and 5. The high number of points (1000) is chosen to make the curve smooth.

4. Initializing Arrays for y Values:
   - Two empty arrays, 'y_positive' and 'y_negative', are initialized. These will store the corresponding positive and negative y values for each x value.

5. Calculating y^2 for Each x:
   - The function iterates over each x value in the range.
   - For each x, it calculates y^2 using the elliptic curve equation: y^2 = x^3 + ax + b.
   - If y^2 is non-negative, indicating real y values exist, it computes both the positive and negative square roots of y^2.

6. Storing y Values:
   - The positive square root is appended to 'y_positive'.
   - The negative square root is appended to 'y_negative'.
   - If y^2 is negative, NaN (Not a Number) is appended to both arrays to maintain the array size. This occurs when there are no real solutions for y at a given x.

7. Plotting the Curve:
   - The plot function is used to plot y values against x values.
   - Positive y values are plotted in blue dots, as are the negative y values, creating a symmetric appearance about the x-axis.
   - The title of the plot describes the equation of the curve, and axis labels 'x' and 'y' are set.
   - Grid lines are enabled for better readability, and axis equal ensures the scale of the x and y axes are the same.

This function effectively visualizes the shape and symmetry of the elliptic curve over the real number field.
