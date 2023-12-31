
Функция ЗарегистрироватьДанныеДляМТСД(ИмяПользователяМТСД, ИмяМенеджераОбъекта, ПараметрыПолученияОбъекта) Экспорт
	
	УзелМТСД = ПланыОбмена.МТСД.НайтиПоНаименованию(ИмяПользователяМТСД);
	Если НЕ ЗначениеЗаполнено(УзелМТСД) Тогда
		ВызватьИсключение "Неизвестное имя пользователя МТСД: " + ИмяПользователяМТСД;
	КонецЕсли;
	
	МенеджерОбъекта = Вычислить(ИмяМенеджераОбъекта);
	Результат = МенеджерОбъекта.ЗарегистрироватьДанныеДляМТСД(УзелМТСД, ПараметрыПолученияОбъекта);
	Возврат Результат;
	
КонецФункции
