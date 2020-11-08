#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

	НаполнитьТаблицуПроверкиМетодовМетодами();

	#Область ДобавлениеСтраниц
	
	КонтекстСтраницы = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, , , Новый Структура("Вид", ВидГруппыФормы.Страницы));
	ГруппаСтраницы = РедакторФорм.НоваяГруппаФормы(КонтекстСтраницы, "ГруппаСтраницы");
	КонтекстСтраницы.Родитель = ГруппаСтраницы;
	КонтекстСтраницы.Свойства.Вид = ВидГруппыФормы.Страница;	
	
	КонтекстСтраницы.Свойства.Вставить("Заголовок", "Основная");
	ГруппаПерваяСтраница = РедакторФорм.НоваяГруппаФормы(КонтекстСтраницы, "ПерваяСтраница");	
	КонтекстСтраницы.Свойства.Вставить("Заголовок", "Итоговая таблица");
	ГруппаВтораяСтраница = РедакторФорм.НоваяГруппаФормы(КонтекстСтраницы, "ВтораяСтраница");
	
	#КонецОбласти
	
	#Область ДобавлениеГрупп
	
	КонтекстФормы = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаПерваяСтраница);
	РедакторФорм.НоваяГруппаКолонкиЛевоПраво(КонтекстФормы, "ГруппаСтроковыхРеквизитов");
	ГруппаСтроковыхРеквизитовЛево = Элементы.ГруппаСтроковыхРеквизитовЛево;
	
	КонтекстФормы = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаСтроковыхРеквизитовЛево);
	РедакторФорм.НоваяГруппаКолонкиЛевоПраво(КонтекстФормы, "ЛеваяПодгруппа");
	ЛеваяПодгруппаЛево = Элементы.ЛеваяПодгруппаЛево;
	ЛеваяПодгруппаПраво = Элементы.ЛеваяПодгруппаПраво;
	
	// Вторая страница
	КонтекстФормы = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаВтораяСтраница, , Новый Структура("Группировка", ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда));
	ГруппаИтоговойТаблицы = РедакторФорм.НоваяГруппаОбычная(КонтекстФормы, "ГруппаИтоговойТаблицы");
	ГруппаРеквизитовИтогов = РедакторФорм.НоваяГруппаОбычная(КонтекстФормы, "ГруппаРеквизитовИтогов");
	
	// Первая страница
	КонтекстФормы = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаПерваяСтраница);
	ГруппаМногострочноеПоле = РедакторФорм.НоваяГруппаОбычная(КонтекстФормы, "ГруппаМногострочноеПоле");

	КонтекстФормы.Свойства.Вставить("Вид", ВидГруппыФормы.ОбычнаяГруппа);
	КонтекстФормы.Свойства.Вставить("Группировка", ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяЕслиВозможно);
	КонтекстФормы.Свойства.Вставить("ОтображатьЗаголовок", Ложь);							
	ГруппаБулево = РедакторФорм.НоваяГруппаФормы(КонтекстФормы, "ГруппаБулево"); 
	
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаКолонкиЛевоПраво", 1);
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаФормы", 1);

	ЛеваяПодгруппаЛево.Группировка = ГруппировкаПодчиненныхЭлементовФормы.Вертикальная;
	#КонецОбласти
	
	#Область СтраницаОсновная
	
	КонтекстКоманда2 = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ЛеваяПодгруппаПраво);
	РедакторФорм.НоваяКомандаИГиперссылкаФормы(КонтекстКоманда2, "КомандаКнопки2", "Подключаемый_КомандаКнопки2", "Очистить все");
	ДобавитьКСчетчикуПоМетоду("НоваяКомандаИГиперссылкаФормы", 1);

	КонтекстФормы = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаМногострочноеПоле);
	РедакторФорм.НовоеМногострочноеПолеРеквизитОбъекта(КонтекстФормы, "МногострочноеПоле");	
	ДобавитьКСчетчикуПоМетоду("НовоеМногострочноеПолеРеквизитОбъекта", 1);	
	ДобавитьКСчетчикуПоМетоду("НовоеПолеФормы", , 1);

	
	СписокВыбора = Новый СписокЗначений;
	СписокВыбора.Добавить("Выбор 1");
	СписокВыбора.Добавить("Выбор 2");	
	СвойстваПоля = Новый Структура("СписокВыбора", СписокВыбора);	
	КонтекстГруппыЛево = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ЛеваяПодгруппаЛево, , СвойстваПоля);	
		
	РедакторФорм.НовоеПолеФормыРеквизитОбъекта(КонтекстГруппыЛево, "РеквизитСтрока");

	ДобавитьКСчетчикуПоМетоду("НовоеПолеФормыРеквизитОбъекта", 1);	
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаКолонкиЛевоПраво", , 1);	
	ДобавитьКСчетчикуПоМетоду("НовыйРеквизитОбъектаФормы", , 1);	

	РедакторФорм.НовоеПолеРеквизитаФормы(КонтекстГруппыЛево, "РеквизитДобавитьПолеНаФормуРеквизитФормы");
	ДобавитьКСчетчикуПоМетоду("НовоеПолеРеквизитаФормы", 1);	
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаФормы", , 1);	

	КонтекстГруппыЛево = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ЛеваяПодгруппаЛево);
	РедакторФорм.НовоеПолеШапкиФормыРеквизитОбъекта(КонтекстГруппыЛево, "РеквизитШапки");
	ДобавитьКСчетчикуПоМетоду("НовоеПолеШапкиФормыРеквизитОбъекта", 1);	
	ДобавитьКСчетчикуПоМетоду("НовоеПолеФормыРеквизитОбъекта", , 1);
		
	КонтекстФормыПоле = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ЛеваяПодгруппаЛево);	
	КонтекстФормыПоле.Свойства.Вставить("ПутьКДанным", "РеквизитДобавитьПолеНаФорму");
	РедакторФорм.НовоеПолеФормы(КонтекстФормыПоле, "РеквизитДобавитьПолеНаФорму");
	ДобавитьКСчетчикуПоМетоду("НовоеПолеФормы", 1);	
	ДобавитьКСчетчикуПоМетоду("НовоеПолеФормыРеквизитОбъекта", , 1);	
	
	КонтекстГруппыБулево = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаБулево);
	РедакторФорм.НовоеПолеФлажокФормыРеквизитОбъекта(КонтекстГруппыБулево, "Флажок");
	ДобавитьКСчетчикуПоМетоду("НовоеПолеФлажокФормыРеквизитОбъекта", 1);	
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаФормы", , 1);	

	РедакторФорм.НовыйРеквизитОбъектаФормы(КонтекстГруппыБулево, "РеквизитБулево");
	ДобавитьКСчетчикуПоМетоду("НовыйРеквизитОбъектаФормы", 1);	
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаФормы", , 1);
	
	КонтекстКоманда = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаБулево);	
	РедакторФорм.НоваяКомандаФормы(КонтекстКоманда, "Подключаемый_КомандаКнопки1", "Подключаемый_КомандаКнопки1", "Информация");
	ДобавитьКСчетчикуПоМетоду("НоваяКомандаФормы", 1);
				
	КонтекстГруппыКнопок = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаБулево);
	РедакторФорм.НоваяКнопкаФормы(КонтекстГруппыКнопок, "КнопкаКоманды1", ВидКнопкиФормы.ОбычнаяКнопка, "Подключаемый_КомандаКнопки1");
	ДобавитьКСчетчикуПоМетоду("НоваяКнопкаФормы", 1);
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаКнопок", , 1);

	#КонецОбласти
			
	#Область СтраницаИтоговая	

	КонтекстГруппаИтоговойТаблицы = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаИтоговойТаблицы);
	
	СтруктураКолонок = Новый Структура;
	СтруктураКолонок.Вставить("ТаблицаПроверряемыеМетодыИмяМетода", "ИмяМетода");
	СтруктураКолонок.Вставить("ТаблицаПроверряемыеМетодыВызвано", "Вызвано");
	СтруктураКолонок.Вставить("ТаблицаПроверряемыеМетодыПроверено", "Проверено");
	ЭлементТаблицаПроверряемыеМетоды = РедакторФорм.НоваяТаблицаФормы(КонтекстГруппаИтоговойТаблицы, "ТаблицаПроверряемыеМетоды", "Объект.ПроверяемыеПроцедурыИФункции", СтруктураКолонок);
	ДобавитьКСчетчикуПоМетоду("НоваяТаблицаФормы", 1);
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаКолонкиЛевоПраво", , 1);	
	
	КонтекстФормы = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаМногострочноеПоле);
	КонтекстФормы.Родитель = ЭлементТаблицаПроверряемыеМетоды;
	КонтекстФормы.Свойства = Новый Структура;
	РедакторФорм.НовоеПолеТабличнойЧастиформы(КонтекстФормы, "Объект.ПроверяемыеПроцедурыИФункции", "Успех");
	ДобавитьКСчетчикуПоМетоду("НовоеПолеТабличнойЧастиформы", 1);
	ДобавитьКСчетчикуПоМетоду("НоваяТаблицаФормы", , 1);
	
	КонтекстПанели = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ЭлементТаблицаПроверряемыеМетоды.КоманднаяПанель);
	РедакторФорм.НоваяГруппаКнопок(КонтекстПанели);	
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаКнопок", 1);	
	ДобавитьКСчетчикуПоМетоду("НоваяТаблицаФормы", , 1);
	
	КонтекстФормы.Родитель = ЭлементТаблицаПроверряемыеМетоды.КоманднаяПанель;
	РедакторФорм.НоваяКомандаИКнопкаКоманднойПанели(КонтекстФормы, "КомандаКнопки3", "Обновить");
	ДобавитьКСчетчикуПоМетоду("НоваяКомандаИКнопкаКоманднойПанели", 1);

	КонтекстПраво = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаРеквизитовИтогов);
	РедакторФорм.НовыйРеквизитОбъектаФормы(КонтекстПраво, "ВсегоПроцедурИФункций");
	ДобавитьКСчетчикуПоМетоду("НовыйРеквизитОбъектаФормы", 1);	
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаФормы", , 1);

	РедакторФорм.НовыйРеквизитОбъектаФормы(КонтекстПраво, "ВсегоУспешных");
	ДобавитьКСчетчикуПоМетоду("НовыйРеквизитОбъектаФормы", 1);	
	ДобавитьКСчетчикуПоМетоду("НоваяГруппаФормы", , 1);

	КонтекстПраво.Свойства = Новый Структура("Заголовок", "Подвести итог");
	РедакторФорм.НоваяКомандаИКнопкаФормы(КонтекстПраво, "КомандаКнопки4", "КомандаКнопки4");
	ДобавитьКСчетчикуПоМетоду("НоваяКомандаИКнопкаФормы", 1);	

	КонтекстФормы = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаМногострочноеПоле);	
	РедакторФорм.НоваяДекорацияНадпись(КонтекстФормы, "ДекорацияТестПрограммное", "Декорация",  Истина);
	ДобавитьКСчетчикуПоМетоду("НоваяДекорацияНадпись", 1);			
	
	
	
	ТекстЗапоса = "ВЫБРАТЬ
				|	1 Как Номер
				|
				|ОБЪЕДИНИТЬ ВСЕ
				|
				|ВЫБРАТЬ
				|	2";				
	СтруктураСвойств = Новый Структура();
	СтруктураСвойств.Вставить("ТекстЗапроса", ТекстЗапоса);			
	СтруктураСвойств.Вставить("ПроизвольныйЗапрос", Истина);	
	КонтекстФормы = РедакторФорм.НовыйКонтекстЭлемента(ЭтотОбъект, ГруппаМногострочноеПоле, , СтруктураСвойств);				
	РедакторФорм.НовыйДинамическийСписокФормы(КонтекстФормы, "ДинамическийСписок", "");	
	
	СтруктураКолонок = Новый Структура();
	СтруктураКолонок.Вставить("Номер", "Номер");			
	
	РедакторФорм.НоваяТаблицаФормы(КонтекстФормы, "ДинамическийСписок", "ДинамическийСписок", СтруктураКолонок);	
	#КонецОбласти
	
	
	
	Если ЭтаФорма.Параметры.Свойство("РедакторФорм") Тогда
		ИмяПодключеннойОбработки = ЭтаФорма.Параметры.РедакторФорм.ИмяПодключеннойОбработки;
		Если ЭтаФорма.Параметры.РедакторФорм.ЗапущенаКакВнешняя Тогда
			ВнешниеОбработки.Создать(ИмяПодключеннойОбработки, Ложь).ПодготовитьДанныеАнализируемойФормы(ЭтаФорма);
		Иначе
			Обработки[ИмяПодключеннойОбработки].Создать().ПодготовитьДанныеАнализируемойФормы(ЭтаФорма);
		КонецЕсли;
	КонецЕсли;

	 
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_КомандаКнопки1(Команда)
	ДобавитьКСчетчикуПоМетоду("НоваяКомандаФормы", 0, 1);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_КомандаКнопки2(Команда)
	ДобавитьКСчетчикуПоМетоду("НоваяКомандаФормы", 0, 1);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_КомандаКнопки3(Команда)
	ДобавитьКСчетчикуПоМетоду("НоваяКомандаФормы", 0, 1);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_КомандаКнопки4(Команда)
	ДобавитьКСчетчикуПоМетоду("НоваяКомандаФормы", 0, 1);
	ОбновитьИтогУспешных();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ОбновитьИтогУспешных()
	
	Объект.ВсегоУспешных = Объект.ПроверяемыеПроцедурыИФункции.Итог("Проверено");
	
КонецПроцедуры

Процедура ДобавитьКСчетчикуПоМетоду(ИмяМетода, Вызвано = 0, Проверено = 0)

	СтруктураПоиска = Новый Структура("ИмяМетода", ИмяМетода);
	СтрокиМетода = Объект.ПроверяемыеПроцедурыИФункции.НайтиСтроки(СтруктураПоиска);
	Для каждого СтрокаМетода Из СтрокиМетода Цикл
		СтрокаМетода.Вызвано = СтрокаМетода.Вызвано + Вызвано;
		СтрокаМетода.Проверено = СтрокаМетода.Проверено + Проверено;
	КонецЦикла;

КонецПроцедуры

Процедура НаполнитьТаблицуПроверкиМетодовМетодами()
	
	МассивИменМетодов = Новый Массив;
	
	// ДобавлениеПолей
	МассивИменМетодов.Добавить("НовоеПолеФормы");
	МассивИменМетодов.Добавить("НовоеПолеРеквизитаФормы");
	
	// ДобавлениеГрупп
	МассивИменМетодов.Добавить("НоваяГруппаФормы");
	МассивИменМетодов.Добавить("НоваяГруппаКолонкиЛевоПраво");

	// ДобавлениеТаблиц
	МассивИменМетодов.Добавить("НоваяТаблицаФормы");
	МассивИменМетодов.Добавить("НовоеПолеТабличнойЧастиформы");
	
	// ДобавлениеКоманд
	МассивИменМетодов.Добавить("НоваяКнопкаФормы");
	МассивИменМетодов.Добавить("НоваяКомандаИГиперссылкаФормы");
	МассивИменМетодов.Добавить("НоваяКомандаИКнопкаКоманднойПанели");	
	МассивИменМетодов.Добавить("НоваяКомандаИКнопкаФормы");
	МассивИменМетодов.Добавить("НоваяКомандаФормы");
	
	// ДобавлениеРеквизитовОбъекта
	МассивИменМетодов.Добавить("НовыйРеквизитОбъектаФормы");
	МассивИменМетодов.Добавить("НовоеПолеФормыРеквизитОбъекта");
	МассивИменМетодов.Добавить("НовоеПолеШапкиФормыРеквизитОбъекта");
	МассивИменМетодов.Добавить("НовоеМногострочноеПолеРеквизитОбъекта");
	МассивИменМетодов.Добавить("НовоеПолеФлажокФормыРеквизитОбъекта");
	МассивИменМетодов.Добавить("НоваяГруппаКнопок");
	
	// ДобавлениеРеквизитовИЭлементвоНаФорму
	МассивИменМетодов.Добавить("НовыйДинамическийСписокФормы");
	
	// ДобавлениеДекораций
	МассивИменМетодов.Добавить("НоваяДекорацияНадпись");
	
	
	Для Каждого ИмяМетода Из МассивИменМетодов Цикл
		НоваяСтрока = Объект.ПроверяемыеПроцедурыИФункции.Добавить();
		НоваяСтрока.ИмяМетода = ИмяМетода;
	КонецЦикла;
	
	Объект.ВсегоПроцедурИФункций = Объект.ПроверяемыеПроцедурыИФункции.Количество();

КонецПроцедуры
	
#КонецОбласти
