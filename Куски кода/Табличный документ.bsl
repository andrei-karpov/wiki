//Чтение EXCEL из 1С 

ТабДокумент = Новый ТабличныйДокумент;
ТабДокумент.Прочитать(КаталогСверки);

ВсегоСтрок = ТабДокумент.ВысотаТаблицы;
ТаблицаДляЗаполнения = Новый ТаблицаЗначений;
ТаблицаДляЗаполнения.Колонки.Добавить("ЗначениеЯчейки", Новый ОписаниеТипов("Строка"));

Для НомерСтроки = 2 ПО ВсегоСтрок Цикл
	НоваяСтрока = ТаблицаДляЗаполнения.Добавить();
	НоваяСтрока.ЗначениеЯчейки = ЗначенияЯчейки(ТабДокумент, НомерСтроки, 2);
КонецЦикла;

Функция ЗначенияЯчейки(ТабДокумент, НомерСтроки, НомерКолонки)                                                                                         
	// Старый вариант
	//ЗначениеЯчейки = СтрЗаменить(СокрЛП(ТабДокумент.Область("R" + Формат(НомерСтроки, "ЧГ=") + "C" + Формат(НомерКолонки, "ЧГ=")).Текст), Символы.НПП, "");	
	
	// НОВЫЙ ВАРИАНТ
	// Отдельная ячейка или область
	ЗначениеЯчейки = ТабДокумент.Область(НомерСтроки, НомерКолонки);
	
	ОбластьСтрока = ТабДокумент.Область(НомерСтроки); // ВСЯ СТРОКА
	ОбластьКолонка = ТабДокумент.Область(, НомерКолонки); // ВСЯ КОЛОНКА
	
    Возврат ЗначениеЯчейки;
КонецФункции