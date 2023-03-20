
USE `Youtube` ;

INSERT INTO Youtube.Canal  VALUES (1, 'Canal de Cocina', 'Un canal dedicado a la cocina y la preparación de alimentos de todo tipo.', '2022-01-01');
INSERT INTO Youtube.Canal  VALUES (2, 'Canal de Viajes', 'Un canal para los amantes de los viajes y la aventura. Descubre los mejores destinos turísticos del mundo.', '2021-05-20');
INSERT INTO Youtube.Canal  VALUES (3, 'Canal de Videojuegos', 'Un canal dedicado a los videojuegos y la tecnología. Descubre las últimas novedades en el mundo gaming.', '2022-02-15');
INSERT INTO Youtube.Canal VALUES (4, 'Canal de Moda', 'Un canal para los amantes de la moda y las últimas tendencias. Descubre los mejores consejos de estilo y belleza.', '2020-11-10');
INSERT INTO Youtube.Canal VALUES (5, 'Canal de Fitness', 'Un canal dedicado al fitness y la vida saludable. Descubre los mejores ejercicios y consejos para mantenerse en forma.', '2021-08-05');

INSERT INTO Youtube.Usuario VALUES (1, 'usuario1@gmail.com', '123456', 'Juan Pérez', '1990-05-20', 'M', 'México', '12345', 2);
INSERT INTO Youtube.Usuario  VALUES (2, 'usuario2@yahoo.com', 'password123', 'Ana Rodríguez', '1995-12-10', 'F', 'Argentina', '54321', 4);
INSERT INTO Youtube.Usuario VALUES (3, 'usuario3@hotmail.com', 'contraseña123', 'Pedro García', '1988-03-15', 'M', 'España', '28001', 1);
INSERT INTO Youtube.Usuario  VALUES (4, 'usuario4@gmail.com', 'password1234', 'María Fernández', '1992-07-25', 'F', 'Colombia', '54321', 3);
INSERT INTO Youtube.Usuario  VALUES (5, 'usuario5@hotmail.com', 'abc123', 'Luis González', '1985-11-05', 'M', 'Perú', '12345', 5);

INSERT INTO Youtube.Video  VALUES (1, 'Tutorial de maquillaje para novias', 'En este video te enseñamos a hacer un maquillaje natural para novias', '100MB', 'tutorial_maquillaje_novias.mp4', '15:30', 'thumbail_novias.jpg', 1000, 50, 2, 'publico', 4, 1);
INSERT INTO Youtube.Video VALUES (2, 'Resumen de la temporada de fútbol', 'Aquí te mostramos los mejores momentos de la temporada de fútbol', '250MB', 'resumen_futbol.mp4', '10:00', 'thumbail_futbol.jpg', 2000, 100, 5, 'publico', 3, 2);
INSERT INTO Youtube.Video  VALUES (3, 'Entrevista con el nuevo presidente', 'En esta entrevista hablamos con el nuevo presidente sobre sus planes para el país', '150MB', 'entrevista_presidente.mp4', '20:30', 'thumbail_presidente.jpg', 500, 25, 0, 'publico', 1, 3);
INSERT INTO Youtube.Video  VALUES (4, 'Recorriendo la ciudad de noche', 'En este video te mostramos los lugares más bonitos de la ciudad durante la noche', '80MB', 'recorrido_nocturno.mp4', '12:00', 'thumbail_noche.jpg', 800, 35, 1, 'publico', 2, 4);
INSERT INTO Youtube.Video  VALUES (5, 'Clases de piano para principiantes', 'En estas clases de piano te enseñamos lo básico para empezar a tocar', '200MB', 'clases_piano_principiantes.mp4', '30:00', 'thumbail_piano.jpg', 300, 20, 0, 'publico',3,1);

INSERT INTO Youtube.Etiqueta VALUES (1, 'Música', 2);
INSERT INTO Youtube.Etiqueta VALUES (2, 'Comedia', 3);
INSERT INTO Youtube.Etiqueta VALUES (3, 'Deportes', 4);
INSERT INTO Youtube.Etiqueta VALUES (4, 'Tecnología', 1);
INSERT INTO Youtube.Etiqueta VALUES (5, 'Educación', 5);

INSERT INTO Youtube.Suscripcion_canales VALUES (1, 2);
INSERT INTO Youtube.Suscripcion_canales VALUES (1, 3);
INSERT INTO Youtube.Suscripcion_canales VALUES (2, 1);
INSERT INTO Youtube.Suscripcion_canales VALUES (3, 2);
INSERT INTO Youtube.Suscripcion_canales VALUES (4, 3);

INSERT INTO Youtube.Playlist VALUES (1, 'Música Pop', '2022-01-01', 'publica', 1);
INSERT INTO Youtube.Playlist VALUES (2, 'Música Rock', '2022-02-15', 'publica', 1);
INSERT INTO Youtube.Playlist VALUES (3, 'Música Electrónica', '2022-03-20', 'publica', 2);
INSERT INTO Youtube.Playlist VALUES (4, 'Videos divertidos', '2022-01-10', 'privada', 3);
INSERT INTO Youtube.Playlist VALUES (5, 'Videos educativos', '2022-02-20', 'publica', 4);

INSERT INTO Youtube.Playlist_has_Video VALUES (1,2);
INSERT INTO Youtube.Playlist_has_Video VALUES (1,3);
INSERT INTO Youtube.Playlist_has_Video VALUES (3,2);
INSERT INTO Youtube.Playlist_has_Video VALUES (3,4);
INSERT INTO Youtube.Playlist_has_Video VALUES (4,2);

INSERT INTO Youtube.Comentarios VALUES(1, 'Excelente video, muy útil la información que compartes', '2023-03-20 14:30:00', 1, 3);
INSERT INTO Youtube.Comentarios VALUES(2, 'No me gustó mucho el video, esperaba algo diferente', '2023-03-18 11:45:00', 2, 4);
INSERT INTO Youtube.Comentarios VALUES(3, '¡Increíble! Este video me salvó la vida en mi proyecto', '2023-03-17 20:15:00', 3, 1);
INSERT INTO Youtube.Comentarios VALUES(4, 'Muy buena la explicación, gracias por compartir', '2023-03-15 09:20:00', 1, 5);
INSERT INTO Youtube.Comentarios VALUES(5, 'No me queda claro un punto, ¿alguien me lo puede explicar?', '2023-03-13 18:10:00', 4, 2);

INSERT INTO Youtube.reaccion_comentarios VALUES(1, 1, '2023-03-20 14:30:00', 'like');
INSERT INTO Youtube.reaccion_comentarios VALUES(2, 3, '2023-03-19 12:45:00', 'dislike');
INSERT INTO Youtube.reaccion_comentarios VALUES(3, 2, '2023-03-18 08:15:00', 'like');
INSERT INTO Youtube.reaccion_comentarios VALUES(4, 5, '2023-03-17 19:30:00', 'dislike');
INSERT INTO Youtube.reaccion_comentarios VALUES(5, 4, '2023-03-16 22:00:00', 'like');

INSERT INTO Youtube.reaccion_videos  VALUES (1, 2, '2022-03-20 10:30:00');
INSERT INTO Youtube.reaccion_videos  VALUES (2, 4, '2022-03-19 15:45:00');
INSERT INTO Youtube.reaccion_videos  VALUES (3, 5, '2022-05-3 20:00:00');
INSERT INTO Youtube.reaccion_videos VALUES (4, 3, '2022-03-18 20:00:00');
INSERT INTO Youtube.reaccion_videos  VALUES (5, 1, '2022-03-17 12:15:00');
