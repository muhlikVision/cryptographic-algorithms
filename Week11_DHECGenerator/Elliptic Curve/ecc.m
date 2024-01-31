function ecc()
    % Input value of the coefficients
    % value of - 6
    firstCoefficient = input('Enter the coefficient (a) =>  ');
    % value of 9 
    secondCoeficient = input('Enter the coefficient (b) =>  ');

    % Define the range of x values
    x = linspace(-5, 5, 1000); % More points for smoother curve

    % Initialize arrays for positive and negative y values
    yPositive = [];
    yNegative = [];

    % Calculate y^2 for each x
    for i = 1:length(x)
        y2 = x(i)^3 + firstCoefficient*x(i) + secondCoeficient;
        if y2 >= 0
            % Calculate square root once and store in both arrays
            sqrt_y2 = sqrt(y2);
            yPositive = [yPositive, sqrt_y2];
            yNegative = [yNegative, -sqrt_y2];
        else
            % Append NaN to maintain array size
            yPositive = [yPositive, NaN];
            yNegative = [yNegative, NaN];
        end
    end

    % Plot the curve
    plot(x, yPositive, 'b.', x, yNegative, 'b.');
    title(['Elliptic Curve y^2 = x^3 + ', num2str(firstCoefficient), 'x + ', num2str(secondCoeficient)]);
    xlabel('x');
    ylabel('y');
    grid on;
    axis equal;
end
