
&НаКлиенте
Асинх Процедура Фото(Команда)
	
	#Если МобильныйКлиент Тогда
	Действие = "android.media.action.IMAGE_CAPTURE";
	ЗапускПриложения = Новый ЗапускПриложенияМобильногоУстройства(Действие);
	
	Если НЕ ЗапускПриложения.ПоддерживаетсяЗапуск() Тогда
		Сообщить("Не поддерживается запуск действия" + Действие); 
		Возврат;
	КонецЕсли;
	
    Результат = Ждать ЗапускПриложения.ЗапуститьАсинх();
	Если Результат.КодРезультата <> -1 Тогда
		Возврат;
	КонецЕсли;		
	
	ЭлементДополнительныхДанных = Результат.ДополнительныеДанные.Получить("data");
	Картинка = ЭлементДополнительныхДанных.Значение;
	#КонецЕсли

КонецПроцедуры

&НаКлиенте
Асинх Процедура Видео(Команда)
	
	#Если МобильныйКлиент Тогда
	Действие = "android.media.action.VIDEO_CAPTURE";
	ЗапускПриложения = Новый ЗапускПриложенияМобильногоУстройства(Действие);
	
	Если НЕ ЗапускПриложения.ПоддерживаетсяЗапуск() Тогда
		Сообщить("Не поддерживается запуск действия" + Действие); 
		Возврат;
	КонецЕсли;
	
    Результат = Ждать ЗапускПриложения.ЗапуститьАсинх();
	Если Результат.КодРезультата <> -1 Тогда
		Возврат;
	КонецЕсли;		
	
	ЭлементДополнительныхДанных = Результат.ДополнительныеДанные.Получить("data");
	Картинка = ЭлементДополнительныхДанных.Значение;
	#КонецЕсли
	
КонецПроцедуры
