#Если МобильныйАвтономныйСервер Тогда

#Область ОбработчикиСобытий

Процедура ОбработкаПолученияФормы(ВидФормы, Параметры, ВыбраннаяФорма, ДополнительнаяИнформация, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	Если ВидФормы = "ФормаСписка" Тогда
		ВыбраннаяФорма = Метаданные.Документы.WA_ЧекЛист.Формы.ФормаСпискаАвтономныйСервер;
	ИначеЕсли ВидФормы = "ФормаОбъекта" Тогда
		ВыбраннаяФорма = Метаданные.Документы.WA_ЧекЛист.Формы.ФормаДокументаАвтономныйСервер;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли

#Если НЕ МобильныйАвтономныйСервер Тогда

#Область СлужебныйПрограммныйИнтерфейс

Функция ЗарегистрироватьДанныеДляМТСД(УзелМТСД, Параметры) Экспорт
	
	ЧекЛист = НайтиПоНомеру(Параметры.НомерДокумента);
	
	Если ЗначениеЗаполнено(ЧекЛист) Тогда
		ДанныеДляРегистрацииКОтправке = Новый Массив;
		ДанныеДляРегистрацииКОтправке.Добавить(ЧекЛист);
		Для каждого Строка из ЧекЛист.РезультатыПроверки Цикл
			ДанныеДляРегистрацииКОтправке.Добавить(Строка.ПунктЧекЛиста);
		КонецЦикла;
		
		ПланыОбмена.ЗарегистрироватьИзменения(УзелМТСД, ЧекЛист);
		
		Если ЗначениеЗаполнено(ЧекЛист.ШаблонЧекЛиста.АлгоритмФормированияДанныхДляМТСД) Тогда
			ДанныеДляМТСД = ВыполнитьАлгоритмФормированияДанныхДляМТСД(ЧекЛист.ШаблонЧекЛиста.АлгоритмФормированияДанныхДляМТСД, ЧекЛист);
			Если ДанныеДляМТСД <> Неопределено Тогда
				РегистрыСведений.МТСД_ДанныеОбъектов.ДобавитьДанные(ЧекЛист, , ДанныеДляМТСД);
			КонецЕсли;
		КонецЕсли;
	КонецЕсли;
	
	Результат = МТСД_ОбменДаннымиВызовСервера.НовыйРезультатРегистрацииДанныхДляМТСД(ЧекЛист);
	Возврат Результат;
	
КонецФункции

Функция ВыполнитьАлгоритмФормированияДанныхДляМТСД(Алгоритм, ЧекЛист)
	
	ДанныеДляМТСД = Неопределено;
	
	Выполнить(Алгоритм);
	
	Возврат ДанныеДляМТСД;
	
КонецФункции

#КонецОбласти

#КонецЕсли

