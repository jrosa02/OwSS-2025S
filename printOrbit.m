function [] = printOrbit(xout, yout, zout)
%PRINTORBIT Wyświetla orbitę wokół Ziemi z układem współrzędnych ECEF
% xout, yout, zout - współrzędne orbity (w km)
R = 6.37314*1e6 ;

% Krok 1: Parametry Ziemi
earth_texture = imread('zdjecia\earthsTexture.jpg'); % Plik graficzny tekstury Ziemi

figHandle = figure(); hold on;
figHandle.Position = [100, 100, 800, 600];
[X, Y, Z] = sphere(100);
X = X * R; % Promień Ziemi w km
Y = Y * R;
Z = -Z * R; % Odwrócenie osi Z, aby pasowało do mapy

surf(X, Y, Z, 'CData', earth_texture, 'FaceColor', 'texturemap', 'EdgeColor', 'none')

plot3(xout, yout, zout, 'c-', 'LineWidth', 2); % Trajektoria orbity w kolorze czerwonym

axis_length = 2*R; % Długość osi względem promienia Ziemi

% Oś X (w kolorze czerwonym)
quiver3(0, 0, 0, axis_length, 0, 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
text(axis_length, 0, 0, 'X', 'FontSize', 12, 'Color', 'r');

% Oś Y (w kolorze zielonym)
quiver3(0, 0, 0, 0, axis_length, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
text(0, axis_length, 0, 'Y', 'FontSize', 12, 'Color', 'g');

% Oś Z (w kolorze niebieskim)
quiver3(0, 0, 0, 0, 0, axis_length, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
text(0, 0, axis_length, 'Z', 'FontSize', 12, 'Color', 'b');

view([109 32]); xlabel("X"); ylabel("Y"); zlabel("Z");
axis equal;
grid on;

%testNEDField([xout, yout, zout]);

hold off;
end

