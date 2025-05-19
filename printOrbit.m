function [] = printOrbit(xout, yout, zout)
%PRINTORBIT Wyświetla orbitę wokół Ziemi z układem współrzędnych ECEF
% xout, yout, zout - współrzędne orbity (w km)

R = 6.37314e6;            % Promień Ziemi w metrach
R0 = 4.2242e7;            % Promień koła w metrach

% Wczytanie tekstury Ziemi
earth_texture = imread('zdjecia\earthsTexture.jpg');

% Przygotowanie sfery Ziemi
figHandle = figure(); hold on;
figHandle.Position = [100, 100, 800, 600];

[X, Y, Z] = sphere(100);
X = X * R;
Y = Y * R;
Z = -Z * R;

% Rysowanie Ziemi z teksturą
surf(X, Y, Z, 'CData', earth_texture, 'FaceColor', 'texturemap', 'EdgeColor', 'none');

% Rysowanie trajektorii orbity
plot3(xout, yout, zout, 'c-', 'LineWidth', 2);

% Rysowanie osi ECEF
axis_length = 2 * R;

quiver3(0, 0, 0, axis_length, 0, 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
text(axis_length, 0, 0, 'X', 'FontSize', 12, 'Color', 'r');

quiver3(0, 0, 0, 0, axis_length, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
text(0, axis_length, 0, 'Y', 'FontSize', 12, 'Color', 'g');

quiver3(0, 0, 0, 0, 0, axis_length, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
text(0, 0, axis_length, 'Z', 'FontSize', 12, 'Color', 'b');

% === Dodanie koła o promieniu R0 w płaszczyźnie XY ===
theta = linspace(0, 2*pi, 500);
circle_x = R0 * cos(theta);
circle_y = R0 * sin(theta);
circle_z = zeros(size(theta)); % na płaszczyźnie Z=0

plot3(circle_x, circle_y, circle_z, 'r--', 'LineWidth', 2);

% Ustawienia widoku
view([109 32]);
xlabel("X"); ylabel("Y"); zlabel("Z");
axis equal;
grid on;

hold off;
end
