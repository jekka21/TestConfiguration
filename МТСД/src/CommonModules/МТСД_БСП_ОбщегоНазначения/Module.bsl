
#Область ПрограммныйИнтерфейс

////////////////////////////////////////////////////////////////////////////////
// Процедуры и функции для работы с типами, объектами метаданных и их строковыми представлениями.

// Возвращает менеджер объекта по ссылке на объект.
// Ограничение: не обрабатываются точки маршрутов бизнес-процессов.
// См. также ОбщегоНазначения.МенеджерОбъектаПоПолномуИмени.
//
// Параметры:
//  Ссылка - ЛюбаяСсылка - объект, менеджер которого требуется получить.
//
// Возвращаемое значение:
//  СправочникМенеджер, ДокументМенеджер, ОбработкаМенеджер, РегистрСведенийМенеджер - менеджер объекта.
//
// Пример:
//  МенеджерСправочника = ОбщегоНазначения.МенеджерОбъектаПоСсылке(СсылкаНаОрганизацию);
//  ПустаяСсылка = МенеджерСправочника.ПустаяСсылка();
//
Функция МенеджерОбъектаПоСсылке(Ссылка) Экспорт
	
	ИмяОбъекта = Ссылка.Метаданные().Имя;
	ТипСсылки = ТипЗнч(Ссылка);
	
	Если Справочники.ТипВсеСсылки().СодержитТип(ТипСсылки) Тогда
		Возврат Справочники[ИмяОбъекта];
		
	ИначеЕсли Документы.ТипВсеСсылки().СодержитТип(ТипСсылки) Тогда
		Возврат Документы[ИмяОбъекта];
		
	ИначеЕсли ПланыВидовХарактеристик.ТипВсеСсылки().СодержитТип(ТипСсылки) Тогда
		Возврат ПланыВидовХарактеристик[ИмяОбъекта];
		
	ИначеЕсли ПланыОбмена.ТипВсеСсылки().СодержитТип(ТипСсылки) Тогда
		Возврат ПланыОбмена[ИмяОбъекта];
		
	ИначеЕсли Перечисления.ТипВсеСсылки().СодержитТип(ТипСсылки) Тогда
		Возврат Перечисления[ИмяОбъекта];
	Иначе
		Возврат Неопределено;
	КонецЕсли;
	
КонецФункции

#КонецОбласти