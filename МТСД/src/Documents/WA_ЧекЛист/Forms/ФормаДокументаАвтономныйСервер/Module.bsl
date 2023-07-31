
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Для каждого Строка из Объект.РезультатыПроверки Цикл
		Строка.ПройденТекст = "Пройден";
		Строка.НеПройденТекст = "Не пройден";
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура РезультатыПроверкиВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	Элементы.ГруппаРезультатыПроверкиСтраницы.ТекущаяСтраница = Элементы.ГруппаРезультатыПроверкиОднаСтрока;
	
КонецПроцедуры

&НаКлиенте
Процедура РезультатыПроверкиПриАктивизацииЯчейки(Элемент)
	
	ТекущиеДанные = Элементы.РезультатыПроверки.ТекущиеДанные;
	Если Элемент.ТекущийЭлемент.Имя = "РезультатыПроверкиПройденТекст" Тогда
		ИзменитьОтметкуПройденНеПройден("Пройден");
	ИначеЕсли Элемент.ТекущийЭлемент.Имя = "РезультатыПроверкиНеПройденТекст" Тогда
		ИзменитьОтметкуПройденНеПройден("НеПройден");
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗавершитьРедактированиеСтрокиРезультатаПроверки(Команда = Неопределено)
	
	Элементы.ГруппаРезультатыПроверкиСтраницы.ТекущаяСтраница = Элементы.ГруппаРезультатыПроверкиТаблица;
	
КонецПроцедуры

&НаКлиенте
Процедура РезультатыПроверкиНеПройденТекстОднаСтрокаНажатие(Элемент, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	ИзменитьОтметкуПройденНеПройден("НеПройден");
	
КонецПроцедуры

&НаКлиенте
Процедура РезультатыПроверкиПройденТекстОднаСтрокаНажатие(Элемент, СтандартнаяОбработка)

	СтандартнаяОбработка = Ложь;
	ИзменитьОтметкуПройденНеПройден("Пройден");

КонецПроцедуры

&НаКлиенте
Процедура ИзменитьОтметкуПройденНеПройден(ИмяПоляОтметки)
	
	ТекущиеДанные = Элементы.РезультатыПроверки.ТекущиеДанные;
	ТекущиеДанные[ИмяПоляОтметки] = НЕ ТекущиеДанные[ИмяПоляОтметки];
	
	ИмяВторогоПоля = ?(ИмяПоляОтметки = "Пройден", "НеПройден", "Пройден");
	ТекущиеДанные[ИмяВторогоПоля] = Ложь;
	
	
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	
	Если Элементы.ГруппаРезультатыПроверкиСтраницы.ТекущаяСтраница = Элементы.ГруппаРезультатыПроверкиОднаСтрока Тогда
		Отказ = Истина;
		ЗавершитьРедактированиеСтрокиРезультатаПроверки();
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	
	Если Элементы.ГруппаРезультатыПроверкиСтраницы.ТекущаяСтраница = Элементы.ГруппаРезультатыПроверкиОднаСтрока Тогда
		Отказ = Истина;
		ЗавершитьРедактированиеСтрокиРезультатаПроверки();
	КонецЕсли;

КонецПроцедуры
