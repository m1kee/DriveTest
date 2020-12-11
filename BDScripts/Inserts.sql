begin 
	print 'Creando tipos de pregunta...'; 
	insert into tipo_pregunta values ('UNICA');
	declare @tipo_unica int;
	set @tipo_unica = @@identity;
	insert into tipo_pregunta values ('MULTIPLE');
	declare @tipo_multiple int;
	set @tipo_multiple = @@identity;
	print 'Tipos de pregunta creados...';

	print 'Creando tipos de usuario...';
	insert into tipo_usuario values ('SUPERADMIN');
	declare @superadmin int;
	set @superadmin = @@identity;
	insert into tipo_usuario values ('ADMINISTRADOR');
	declare @administrador int;
	set @administrador = @@identity;
	insert into tipo_usuario values ('ESTUDIANTE');
	declare @estudiante int;
	set @estudiante = @@identity;
	print 'Tipos de usuario creados...';

	print 'Creando Super Administrador del sistema...';
	insert into usuario values ('18.905.524-2', 'ae46c0216b7637cd4f454d0507799cd2' ,'MICHAEL', 'JOSEPH', 'NÚÑEZ', 'BOBADILLA', 'MICHAEL.NUNEZB@OUTLOOK.COM', '+56944738082', @superadmin);
	print 'Super Administrador del sistema creado...';

	declare @id_pregunta int;
	declare @verdadera bit; set @verdadera = 1;
	declare @falsa bit; set @falsa = 0;
	declare @sin_comentario varchar; set @sin_comentario = null;
	declare @alternativas_aleatorias bit; set @alternativas_aleatorias = 1;
	declare @alternativas_ordenadas bit; set @alternativas_ordenadas = 0;
	declare @clase_examen varchar(20); set @clase_examen = 'exam_claseB_preg';

	print 'Insertando Pregunta N°1...'
	insert into pregunta values(@tipo_unica, 'Su vehículo se desvía hacia un lado cuando usted frena. Usted debería:', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Cambiar los neumáticos de un lado hacia el otro y viceversa.', @falsa);
	insert into alternativa values(@id_pregunta, 'Bombear el pedal al frenar.', @falsa);
	insert into alternativa values(@id_pregunta, 'Usar su freno de mano.', @falsa);
	insert into alternativa values(@id_pregunta, 'Consultar con su mecánico lo antes posible.', @verdadera);
	print 'Pregunta N°1 Insertada...'

	print 'Insertando Pregunta N°2...'
	insert into pregunta values(@tipo_unica, 'Su vehículo se desvía hacia un lado cuando usted frena. ¿Cuál es la falla más probable?', 'Las palabras "falla más probable" hace que sea "Frenos mal ajustados" la respuesta correcta.', @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Un bajo nivel del líquido de frenos.', @falsa);
	insert into alternativa values(@id_pregunta, 'Su freno de mano está todavía puesto.', @falsa);
	insert into alternativa values(@id_pregunta, 'Frenos mal ajustados.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Neumáticos con presión de aire inadecuada.', @falsa);
	print 'Pregunta N°2 Insertada...'

	print 'Insertando Pregunta N°3...'
	insert into pregunta values(@tipo_unica, 'Mientras conduce usted siente un fuerte olor a gasolina. ¿Qué debería hacer usted?', 'Su vehículo podría incendiarse si continúa manejando.', @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'No preocuparse, ya que sólo son los gases de escape.', @falsa);
	insert into alternativa values(@id_pregunta, 'Continuar a una velocidad reducida.', @falsa);
	insert into alternativa values(@id_pregunta, 'Continuar por que sabe que se detendrá algunos kilómetros más allá.', @falsa);
	insert into alternativa values(@id_pregunta, 'Detenerse e investigar el problema.', @verdadera);
	print 'Pregunta N°3 Insertada...'

	print 'Insertando Pregunta N°4...'
	insert into pregunta values(@tipo_unica, '¿Cómo puede prevenir usted el riesgo de incendio de su vehículo?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Manteniendo los niveles de agua sobre el máximo.', @falsa);
	insert into alternativa values(@id_pregunta, 'Evitando conducir con el estanque lleno de combustible.', @falsa);
	insert into alternativa values(@id_pregunta, 'Usando gasolina sin plomo.', @falsa);
	insert into alternativa values(@id_pregunta, 'Revisando su vehículo ante cualquier olor a gasolina extraño.', @verdadera);
	print 'Pregunta N°4 Insertada...'

	print 'Insertando Pregunta N°5...'
	insert into pregunta values(@tipo_unica, '¿Porqué es importante usar zapatos apropiados cuando conduce?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Para tener un adecuado control de los pedales.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Para evitar el desgaste acelerado de las gomas de los pedales.', @falsa);
	insert into alternativa values(@id_pregunta, 'Para poder efectuar los cambios de marcha más rápidamente.', @falsa);
	insert into alternativa values(@id_pregunta, 'Para poder caminar sin problemas en el caso que necesite solicitar ayuda.', @falsa);
	print 'Pregunta N°5 Insertada...'

	print 'Insertando Pregunta N°6...'
	insert into pregunta values(@tipo_unica, 'En un automóvil, ¿cuál de los siguientes elementos reduce el riesgo de lesiones de cuello en una colisión?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Un asiento dotado de air-bag (bolsa de aire).', @falsa);
	insert into alternativa values(@id_pregunta, 'Los frenos ABS.', @falsa);
	insert into alternativa values(@id_pregunta, 'Una columna de dirección colapsable.', @falsa);
	insert into alternativa values(@id_pregunta, 'Un asiento con apoya-cabeza ajustado en forma apropiada.', @verdadera);
	print 'Pregunta N°6 Insertada...'

	print 'Insertando Pregunta N°7...'
	insert into pregunta values(@tipo_unica, '¿Qué significa esta luz de advertencia en el panel de instrumentos?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Luces neblineras.', @falsa);
	insert into alternativa values(@id_pregunta, 'Intermitentes de advertencia de peligro.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Luces altas.', @falsa);
	insert into alternativa values(@id_pregunta, 'Freno de mano puesto.', @falsa);
	insert into imagen values (@id_pregunta, concat(@clase_examen, @id_pregunta) ,'png');
	print 'Pregunta N°7 Insertada...'

	print 'Insertando Pregunta N°8...'
	insert into pregunta values(@tipo_unica, 'Es esencial que la presión de los neumáticos sea chequeada regularmente. ¿Cuándo se debe hacer esto?', 'Chequear los neumáticos cuando están fríos permite una lectura más precisa.', @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Después de un viaje largo.', @falsa);
	insert into alternativa values(@id_pregunta, 'Después de conducir a alta velocidad.', @falsa);
	insert into alternativa values(@id_pregunta, 'Cuando los neumáticos están fríos.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Cuando los neumáticos están calientes.', @falsa);
	print 'Pregunta N°8 Insertada...'

	print 'Insertando Pregunta N°9...'
	insert into pregunta values(@tipo_unica, 'La presión de los neumáticosdebe revisarse:', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Cuando los neumáticos están fríos.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Cuando los neumáticos están calientes.', @falsa);
	insert into alternativa values(@id_pregunta, 'En cualquier momento, porque da igual que los neumáticos estén fríos o calientes.', @falsa);
	print 'Pregunta N°9 Insertada...'

	print 'Insertando Pregunta N°10...'
	insert into pregunta values(@tipo_unica, '¿Cuál de estos líquidos, en el caso de estar en un nivel bajo, podría causar un accidente?', 'Un nivel bajo del líquido de frenos puede hacer que estos fallen.', @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'El líquido de freno.', @verdadera);
	insert into alternativa values(@id_pregunta, 'El anticongelante.', @falsa);
	insert into alternativa values(@id_pregunta, 'El agua de la batería.', @falsa);
	insert into alternativa values(@id_pregunta, 'El líquido refrigerante.', @falsa);
	print 'Pregunta N°10 Insertada...'

	print 'Insertando Pregunta N°11...'
	insert into pregunta values(@tipo_unica, 'Frente a una situación normal, ¿Cuál es la forma más segura de frenar?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Frenando fuerte, poniendo la palanca de cambio en neutro y tirando el freno de mano justo antes de detenerse.', @falsa);
	insert into alternativa values(@id_pregunta, 'Frenando suavemente, presionando el pedal de embrague y tirando el freno de mano justo antes de detenerse.', @falsa);
	insert into alternativa values(@id_pregunta, 'Poniendo la palanca de cambio en neutro, frenando fuerte y luego soltando el freno justo antes de detenerse.', @falsa);
	insert into alternativa values(@id_pregunta, 'Frenando suavemente, luego un poco mas fuerte cuando comienza a detenerse y después aflojando de a poco el freno antes de detenerse.', @verdadera);
	print 'Pregunta N°11 Insertada...'

	print 'Insertando Pregunta N°12...'
	insert into pregunta values(@tipo_unica, '¿Cuándo usaría usted las luces intermitentes de advertencia de peligro?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Cuando esté en pana obstruyendo el tránsito.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Cuando se estacione en doble fila respecto a otro vehículo estacionado junto a la cuneta.', @falsa);
	insert into alternativa values(@id_pregunta, 'Cuando estacione junto a una cuneta en la que hay linea amarilla pintada.', @falsa);
	insert into alternativa values(@id_pregunta, 'Cuando sus señalizadores de viraje no estén funcionando.', @falsa);
	print 'Pregunta N°12 Insertada...'
	
	print 'Insertando Pregunta N°13...'
	insert into pregunta values(@tipo_unica, 'Las luces de advertencia de peligro deberían ser usadas:', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Cuando estaciona en doble fila respecto a otro vehículo estacionado junto a la cuneta.', @falsa);
	insert into alternativa values(@id_pregunta, 'Para advertir a quienes vienen detrás, que hay un peligro mas adelante.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Para advertir a quienes vienen detrás suyo, que usted pretende virar.', @falsa);
	insert into alternativa values(@id_pregunta, 'Para advertir a los demás que usted tiene prisa.', @falsa);
	print 'Pregunta N°13 Insertada...'

	print 'Insertando Pregunta N°14...'
	insert into pregunta values(@tipo_unica, '¿Cuándo usaría usted las luces de advertencia de peligro de su vehículo?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Cuando esté en pana moviéndose lentamente.', @falsa);
	insert into alternativa values(@id_pregunta, 'Cuando esté siendo remolcado.', @falsa);
	insert into alternativa values(@id_pregunta, 'Cuando esté retrocediendo en una calle de poco tránsito.', @falsa);
	insert into alternativa values(@id_pregunta, 'Cuando esté en pana y obstaculizando el tránsito.', @verdadera);
	print 'Pregunta N°14 Insertada...'

	print 'Insertando Pregunta N°15...'
	insert into pregunta values(@tipo_unica, 'Usted está probando la suspensión de su vehículo, cuando nota que éste rebota u oscila al cargarlo en un extremo lateral frontal. ¿Qué significa esto?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Neumáticos gastados.', @falsa);
	insert into alternativa values(@id_pregunta, 'Neumáticos poco inflados.', @falsa);
	insert into alternativa values(@id_pregunta, 'Volante de dirección no centrado.', @falsa);
	insert into alternativa values(@id_pregunta, 'Amortiguadores gastados.', @verdadera);
	print 'Pregunta N°15 Insertada...'

	print 'Insertando Pregunta N°16...'
	insert into pregunta values(@tipo_unica, '¿Porqué los neumáticos deben mentenerse a la presión indicada por el fabricante?', 'Presiones de neumáticos incorrectas se suman al riesgo del ronceo.', @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Para que el vehículo se mantenga a la altura correcta sobre la vía.', @falsa);
	insert into alternativa values(@id_pregunta, 'Para no desgastar el motor.', @falsa);
	insert into alternativa values(@id_pregunta, 'Para ayudar a evitar que el automóvil se roncee.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Para evitar que el automóvil se incline hacia un lado.', @falsa);
	print 'Pregunta N°16 Insertada...'

	print 'Insertando Pregunta N°17...'
	insert into pregunta values(@tipo_unica, '¿A qué se debe un alto consumo de combustible?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Fallas en el sistema de dirección.', @falsa);
	insert into alternativa values(@id_pregunta, 'Aceleraciones en curvas.', @falsa);
	insert into alternativa values(@id_pregunta, 'Frecuentes frenadas y aceleraciones.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Conducciones en marchas altas.', @falsa);
	print 'Pregunta N°17 Insertada...'

	print 'Insertando Pregunta N°18...'
	insert into pregunta values(@tipo_unica, 'La profundidad de los surcos de los neumáticos de un automóvil no debería ser inferior a...', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, '5.0mm.', @falsa);
	insert into alternativa values(@id_pregunta, '4.0mm.', @falsa);
	insert into alternativa values(@id_pregunta, '1.6mm.', @verdadera);
	insert into alternativa values(@id_pregunta, '1.0mm.', @falsa);
	print 'Pregunta N°18 Insertada...'

	print 'Insertando Pregunta N°19...'
	insert into pregunta values(@tipo_multiple, 'Uno de los neumáticos traseros se revienta mientras usted conduce. ¿Cuáles 2 cosas debe hacer usted?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Poner marcha atrás para detener el vehículo.', @falsa);
	insert into alternativa values(@id_pregunta, 'Hacer una señal de detención con el brazo y disminuir la velocidad.', @falsa);
	insert into alternativa values(@id_pregunta, 'Detenerse lentamente al costado de la vía.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Detener el vehículo frenando lo mas fuerte que pueda.', @falsa);
	insert into alternativa values(@id_pregunta, 'Girar el volante hacia el mismo lado hacia el cual se desvía la cola del vehículo.', @verdadera);
	print 'Pregunta N°19 Insertada...'	

	print 'Insertando Pregunta N°20...'
	insert into pregunta values(@tipo_multiple, '¿Cuáles 2 cosas debe hacer usted si se le revienta un neumático delantero?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Cambiarse de pista y frenar a fondo.', @falsa);
	insert into alternativa values(@id_pregunta, 'Frenar suavemente o dejar que el vehículo siga hasta detenerse.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Frenar rápida y firmemente.', @falsa);
	insert into alternativa values(@id_pregunta, 'Sostener firmemente el volante manteniendo la trayectoria.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Sostener el volante con una mano advirtiendo con la otra a los demás que usted se detendrá.', @falsa);
	print 'Pregunta N°20 Insertada...'	

	print 'Insertando Pregunta N°21...'
	insert into pregunta values(@tipo_unica, '¿Qué es lo que usted nunca debería hacer en una bomba de bencina?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Circular por ella.', @falsa);
	insert into alternativa values(@id_pregunta, 'Fumar.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Comer.', @falsa);
	insert into alternativa values(@id_pregunta, 'Lavar los parabrisas.', @falsa);
	print 'Pregunta N°21 Insertada...'	

	print 'Insertando Pregunta N°22...'
	insert into pregunta values(@tipo_unica, 'Desenganchar el motor del vehículo...', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Permite un mejor control al conductor.', @falsa);
	insert into alternativa values(@id_pregunta, 'Hace más fácil las maniobras.', @falsa);
	insert into alternativa values(@id_pregunta, 'Aumenta el consumo de combustible.', @falsa);
	insert into alternativa values(@id_pregunta, 'Reduce el control del conductor.', @verdadera);
	print 'Pregunta N°22 Insertada...'	

	print 'Insertando Pregunta N°23...'
	insert into pregunta values(@tipo_unica, '¿Porqué no es bueno desenganchar el motor del vehículo al ir circulando?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Porque ello hace que el vehículo resbale.', @falsa);
	insert into alternativa values(@id_pregunta, 'Porque el motor se detendrá.', @falsa);
	insert into alternativa values(@id_pregunta, 'Porque no hay frenado de motor.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Porque el motor funcionará más rápido.', @falsa);
	print 'Pregunta N°23 Insertada...'

	print 'Insertando Pregunta N°24...'
	insert into pregunta values(@tipo_multiple, '¿Cuáles son las 2 principales razones por las cuales no debe desengancharse el motor al ir cuesta abajo?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Porque tendrá menor control del frenado y dirección.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Porque el vehículo agarrará velocidad.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Porque el consumo de combustible será mayor.', @falsa);
	insert into alternativa values(@id_pregunta, 'Porque se gastan y deterioran más los neumáticos.', @falsa);
	insert into alternativa values(@id_pregunta, 'Porque se daña el motor.', @falsa);	
	print 'Pregunta N°24 Insertada...'

	print 'Insertando Pregunta N°25...'
	insert into pregunta values(@tipo_unica, '¿Porqué usted no debería conducir presionando el pedal de embrague durante mas tiempo que el necesario?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Porque reduce el control sobre su vehículo.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Porque aumenta el desgaste de la caja de cambios.', @falsa);
	insert into alternativa values(@id_pregunta, 'Porque aumenta el consumo de combustible.', @falsa);
	insert into alternativa values(@id_pregunta, 'Porque reduce el agarre de los neumáticos.', @falsa);
	print 'Pregunta N°25 Insertada...'

	print 'Insertando Pregunta N°26...'
	insert into pregunta values(@tipo_unica, '¿Para qué sirven los seguros de niños de los vehículos?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Aseguran las hebillas de los cinturones de seguridad.', @falsa);
	insert into alternativa values(@id_pregunta, 'Impiden que las puertas puedan abrirse desde el interior.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Bloquean las ventanas traseras manteniéndolas cerradas.', @falsa);
	insert into alternativa values(@id_pregunta, 'Impiden que los asientos se reclinen.', @falsa);
	print 'Pregunta N°26 Insertada...'

	print 'Insertando Pregunta N°27...'
	insert into pregunta values(@tipo_unica, 'Una baja presión de los neumáticos delanteros...', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Hace que el vehículo tienda a torcer hacia un lado.', @falsa);
	insert into alternativa values(@id_pregunta, 'Mejora el rendimiento del combustible.', @falsa);
	insert into alternativa values(@id_pregunta, 'Hace sentir la dirección más liviana.', @falsa);
	insert into alternativa values(@id_pregunta, 'Hace sentir la dirección más pesada.', @verdadera);
	print 'Pregunta N°27 Insertada...'

	print 'Insertando Pregunta N°28...'
	insert into pregunta values(@tipo_unica, 'En un pavimento mojado, ¿influye el estado de los neumáticos en la distancia de frenado de su vehículo?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'No, la distancia de frenado depende sólo de la velocidad.', @falsa);
	insert into alternativa values(@id_pregunta, 'No, porque una vez que se acciona el freno la distancia de frenado es siempre la misma para cada vehículo.', @falsa);
	insert into alternativa values(@id_pregunta, 'Si, a mayor desgaste de los neumáticos menor es dicha distancia.', @falsa);
	insert into alternativa values(@id_pregunta, 'Si, porque el mayor o menor desgaste de los neumáticos, entre otros factores, determinan que dicha distancia sea mayor o menor.', @verdadera);
	print 'Pregunta N°28 Insertada...'

	print 'Insertando Pregunta N°29...'
	insert into pregunta values(@tipo_multiple, '¿Cuál o cuáles de las siguientes afirmaciones es(son) verdadera(s)?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Cuando el motor no esté siendo lubricado se enciende una luz en el panel de instrumentos del vehículo.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Una batería mal cargada hace que el vehículo tenga dificultades para arrancar.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Casi siempre, el motor se enfría con un líquido refrigerante que circula por canales en el bloque del motor.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Una temperatura del motor demasiado alta puede deberse a que se haya roto la correa de bomba de agua.', @verdadera);
	print 'Pregunta N°29 Insertada...'

	print 'Insertando Pregunta N°30...'
	insert into pregunta values(@tipo_multiple, '¿Cuáles 2 de las siguientes afirmaciones son verdaderas?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Los gases de escape no son peligroso para la salud de las personas.', @falsa);
	insert into alternativa values(@id_pregunta, 'Un sistema de escape de gases oxidado puede hacer que penetre monóxido de carbono al interior del vehículo.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Los gases de escape contienen monóxido de carbono, que carece de olor y es incoloro.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Los vapores de la gasolina son inocuos.', @falsa);
	print 'Pregunta N°30 Insertada...'

	print 'Insertando Pregunta N°31...'
	insert into pregunta values(@tipo_multiple, '¿Cuáles 2 de las siguientes afirmaciones son verdaderas?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'A mayor velocidad, mayor es el consumo del líquido de los frenos.', @falsa);
	insert into alternativa values(@id_pregunta, 'Los frenos antibloqueo tienen la ventaja de impedir que las ruedas queden bloqueadas al frenar fuertemente.', @verdadera);
	insert into alternativa values(@id_pregunta, 'El consumo del líquido de frenos depende de la cantidad e intensidad de las frenadas.', @falsa);
	insert into alternativa values(@id_pregunta, 'El líquido de frenos no se consume y si disminuye es porque hay algún defecto.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Lo mejor es que el pedal de freno se sienta elástico.', @falsa);
	print 'Pregunta N°31 Insertada...'

	print 'Insertando Pregunta N°32...'
	insert into pregunta values(@tipo_multiple, '¿Cuál o cuáles de las siguientes afirmaciones es(son) verdadera(s)?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Una profundidad de 1mm de los surcos de las bandas de rodamiento de los neumáticos siempre es suficiente para asegurar una buena fricción con el pavimento.', @falsa);
	insert into alternativa values(@id_pregunta, 'Un desgaste notorio de la zona central de las bandas de rodamiento de los neumáticos indica que éstos se han usado con muy poco aire.', @falsa);
	insert into alternativa values(@id_pregunta, 'Un desgaste irregular de los neumáticos puede deberse a problemas de alineamiento o de amortiguación.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Independientemente de la ubicación de las ruedas de tracción, para una buena estabilidad del vehículo los mejores neumáticos deben ir adelante.', @falsa);
	print 'Pregunta N°32 Insertada...'

	print 'Insertando Pregunta N°33...'
	insert into pregunta values(@tipo_multiple, '¿Cuál o cuáles de las siguientes afirmaciones es(son) verdadera(s)?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'El cinturon de seguridad disminuye las posibilidades de sufrir lesiones en un accidente.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Los air-bags(o bolsas de aire) reemplzan ventajosamente al cinturon de seguridad.', @falsa);
	insert into alternativa values(@id_pregunta, 'Para quienes viajan en el asiento trasero de un automóvil el cinturon de seguridad no les presta utilidad.', @falsa);
	insert into alternativa values(@id_pregunta, 'Usar cinturon de seguridad es mas necesario cuando se conduce en carreteras.', @falsa);
	print 'Pregunta N°33 Insertada...'

	print 'Insertando Pregunta N°34...'
	insert into pregunta values(@tipo_multiple, '¿Cuál o cuáles de las siguientes afirmaciones es(son) verdadera(s)?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'No es seguro que un adulto lleve a un niño pequeño incluyendolo en su cinturon de seguridad.', @verdadera);
	insert into alternativa values(@id_pregunta, 'El cinturon de seguridad disminuye las posibilidades de resultar lesionado en un accidente.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Para quienes viajan en el asiento trasero el cinturon de seguridad no brinda mayor seguridad.', @falsa);
	insert into alternativa values(@id_pregunta, 'Un cinturon de seguridad bien tensado brinda mayor seguridad que uno menos tensado.', @verdadera);
	print 'Pregunta N°34 Insertada...'

	print 'Insertando Pregunta N°35...'
	insert into pregunta values(@tipo_multiple, '¿Qué elementos de su vehículo debe usted mantener limpios?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Las luces.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Los espejos.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Los neumáticos.', @falsa);
	insert into alternativa values(@id_pregunta, 'Los vidrios.', @verdadera);
	print 'Pregunta N°35 Insertada...'

	print 'Insertando Pregunta N°36...'
	insert into pregunta values(@tipo_unica, 'Suponga que en una ocasión: &lt;br /&gt;- Su distancia de reacción es de 10 metros &lt;br /&gt;- Su distancia de frenado es de 8 metros &lt;br /&gt;- Su distancia de detención (distancia de reacción más distancia de frenado) es de 18 metros &lt;br /&gt;¿Cuál seria su distancia de detención si sigue conduciendo en calzada de identicas caracteristicas y condiciones, pero aumenta al doble su velocidad?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, '46 metros.', @falsa);
	insert into alternativa values(@id_pregunta, '52 metros.', @verdadera);
	insert into alternativa values(@id_pregunta, '64 metros.', @falsa);
	insert into alternativa values(@id_pregunta, '78 metros.', @falsa);
	print 'Pregunta N°36 Insertada...'

	print 'Insertando Pregunta N°37...'
	insert into pregunta values(@tipo_unica, '¿Cuál de las siguientes afirmaciones es falsa cuando usted aumenta su velocidad de 30 km/h a 60 km/h?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Se duplica la energía cinética.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Se cuadruplica la energía cinética.', @falsa);
	insert into alternativa values(@id_pregunta, 'Se duplica la distancia de reacción.', @falsa);
	insert into alternativa values(@id_pregunta, 'Se cuadruplica la distancia de frenado.', @falsa);
	print 'Pregunta N°37 Insertada...'

	print 'Insertando Pregunta N°38...'
	insert into pregunta values(@tipo_multiple, 'El auto azul circula a 70 km/h y el rojo a 90 km/h. ¿Dónde es más probable que sus conductores estimen el punto en donde se producirá el encuentro de ambos vehículos?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'El conductor de auto rojo estima que dicho punto será el 3.', @verdadera);
	insert into alternativa values(@id_pregunta, 'El conductor de auto rojo estima que dicho punto será el 2.', @falsa);
	insert into alternativa values(@id_pregunta, 'El conductor de auto azul estima que dicho punto será el 1.', @falsa);
	insert into alternativa values(@id_pregunta, 'El conductor de auto azul estima que dicho punto será el 3.', @verdadera);
	insert into imagen values (@id_pregunta, concat(@clase_examen, @id_pregunta) ,'png');
	print 'Pregunta N°38 Insertada...'

	print 'Insertando Pregunta N°39...'
	insert into pregunta values(@tipo_unica, '¿Qué distancia de detención tiene un tren que circula a alrededor de 100 km/h?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Aproximadamente 100 metros.', @falsa);
	insert into alternativa values(@id_pregunta, 'Aproximadamente 200 metros.', @falsa);
	insert into alternativa values(@id_pregunta, 'Entre 800 y 1000 metros.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Más de 2000 metros.', @falsa);
	print 'Pregunta N°39 Insertada...'

	print 'Insertando Pregunta N°40...'
	insert into pregunta values(@tipo_unica, '¿Qué que es lo más importante para evitar chocar al vehículo que va adelante?', 'El factor más importante es "Mantener una adecuada distancia entre vehículos". Obviamente "Asegurarse que sus frenos sean eficientes" y "Tener neumáticos en muy buen estado" también ayudarían.', @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Asegurarse que sus frenos sean eficientes.', @falsa);
	insert into alternativa values(@id_pregunta, 'Conducir a una velocidad constante.', @falsa);
	insert into alternativa values(@id_pregunta, 'Mantener una adecuada distancia entre vehículos.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Tener neumáticos en muy buen estado.', @falsa);
	print 'Pregunta N°40 Insertada...'

	print 'Insertando Pregunta N°41...'
	insert into pregunta values(@tipo_unica, 'Usted va circulando a 50 km/h a lo largo de un camino plano y de asfalto. Las condiciones climáticas son buenas. Sus neumáticos y frenos también están buenos. En estas circunstancias, detenerse le tomará aproximadamente...', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Unos 50 metros.', @falsa);
	insert into alternativa values(@id_pregunta, 'Unos 15 metros.', @falsa);
	insert into alternativa values(@id_pregunta, 'Unos 10 metros.', @falsa);
	insert into alternativa values(@id_pregunta, 'Unos 30 metros.', @verdadera);
	print 'Pregunta N°41 Insertada...'

	print 'Insertando Pregunta N°42...'
	insert into pregunta values(@tipo_unica, 'La distancia de detención total es igual a la suma de la distancia de reacción y la de frenado. Aproximadamente, ¿Cúal es la mínima distancia de detención en un asfalto seco, si usted viaja a 90 km/h?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Unos 50 metros.', @falsa);
	insert into alternativa values(@id_pregunta, 'Unos 70 metros.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Unos 30 metros.', @falsa);
	insert into alternativa values(@id_pregunta, 'Unos 120 metros.', @falsa);
	print 'Pregunta N°42 Insertada...'

	print 'Insertando Pregunta N°43...'
	insert into pregunta values(@tipo_unica, 'Usted conduce un vehículo con frenos y neumáticos en buenas condiciones. La superficie de la calzada está seca. ¿Cúal es la distancia aproximada de detención total (distancia de reacción más distancia de frenado) su usted va a 70 km/h?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Unos 15 metros.', @falsa);
	insert into alternativa values(@id_pregunta, 'Unos 80 metros.', @falsa);
	insert into alternativa values(@id_pregunta, 'Unos 45 metros.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Unos 25 metros.', @falsa);
	print 'Pregunta N°43 Insertada...'

	print 'Insertando Pregunta N°44...'
	insert into pregunta values(@tipo_multiple, 'Usted desea estacionar en una bajada en una calle con pendiente pronunciada. ¿Qué debería hacer?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Estacionar detrás de otro auto.', @falsa);
	insert into alternativa values(@id_pregunta, 'Estacionar con dos ruedas sobre la acera.', @falsa);
	insert into alternativa values(@id_pregunta, 'Dejar el volante girado hacia la acera.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Dejar puesto el freno de mano.', @verdadera);
	print 'Pregunta N°44 Insertada...'

	print 'Insertando Pregunta N°45...'
	insert into pregunta values(@tipo_unica, 'Usted está descendiendo una pendiente muy larga. ¿Qué debería hacer para ayudar a controlar la velocidad de su vehículo?', @sin_comentario, @alternativas_aleatorias);
	set @id_pregunta = @@identity
	insert into alternativa values(@id_pregunta, 'Tomar el manubrio firmemente.', @falsa);
	insert into alternativa values(@id_pregunta, 'Seleccionar una marcha baja.', @verdadera);
	insert into alternativa values(@id_pregunta, 'Seleccionar neutro.', @falsa);
	insert into alternativa values(@id_pregunta, 'Presionar el pedal de embrague.', @falsa);
	print 'Pregunta N°45 Insertada...'
end