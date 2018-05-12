﻿
// Сформировать печатные формы объектов.
//
// ВХОДЯЩИЕ:
//   МассивОбъектов  - Массив    - Массив ссылок на объекты которые нужно распечатать.
//
// ИСХОДЯЩИЕ:
//   КоллекцияПечатныхФорм - Таблица значений - Сформированные табличные документы.
//   ОшибкиПечати          - Список значений  - Ошибки печати  (значение - ссылка на объект, представление - текст
//                           ошибки).
//   ОбъектыПечати         - Список значений  - Объекты печати (значение - ссылка на объект, представление - имя
//                           области в которой был выведен объект).
//   ПараметрыВывода       - Структура        - Параметры сформированных табличных документов.
//
Процедура Печать(МассивОбъектов, ПараметрыПечати, КоллекцияПечатныхФорм, ОбъектыПечати, ПараметрыВывода) Экспорт
	
	Если УправлениеПечатью.НужноПечататьМакет(КоллекцияПечатныхФорм, "bn_ТрудовойДоговор") Тогда //TODO: передать из настроек нужной ПФ
		УправлениеПечатью.ВывестиТабличныйДокументВКоллекцию(
			КоллекцияПечатныхФорм,
			"bn_ТрудовойДоговор", НСтр("ru = 'Трудовой договор (настраиваемый)'"), //TODO: передать из настроек нужной ПФ
			ТабличныйДокументТрудовогоДоговора(ПолучитьМакет("bn_ШаблонТрудовогоДоговора"), МассивОбъектов, ОбъектыПечати), ,
			"Обработка.bn_ПечатьТрудовогоДоговора.bn_ШаблонТрудовогоДоговора");
	КонецЕсли;
	
КонецПроцедуры

Функция ТабличныйДокументТрудовогоДоговора(Макет, МассивОбъектов, ОбъектыПечати)
	
	//#Если Ложь Тогда
	//	Макет = ПолучитьМакет("bn_ШаблонТрудовогоДоговора");
	//#КонецЕсли
	
	ТаблицаРезультат = Новый ТабличныйДокумент;
	
	ДанныеТрудовыхДоговоров = КадровыйУчет.ДанныеТрудовыхДоговоров(МассивОбъектов, Ложь, Ложь);
	
	Для Каждого ДанныеТрудовогоДоговора Из ДанныеТрудовыхДоговоров Цикл
		
		ОбластьМакета = Макет.ПолучитьОбласть("Заголовок");
		ОбластьМакета.Параметры.Заполнить(ДанныеТрудовогоДоговора);
		ТаблицаРезультат.Вывести(ОбластьМакета);
		
		ОбластьМакета = Макет.ПолучитьОбласть("Вступление");
		ОбластьМакета.Параметры.Заполнить(ДанныеТрудовогоДоговора);
		ОбластьМакета.Параметры.НПП = Символы.НПП + Символы.НПП;
		ОбластьМакета.Параметры.ОбособленноеПодразделение = ?(ДанныеТрудовогоДоговора.Подразделение.ОбособленноеПодразделение, "обособленного подразделения", "");
		ОбластьМакета.Параметры.Окончание1 = ?(ДанныеТрудовогоДоговора.Ссылка.ФизическоеЛицо.Пол = Перечисления.ПолФизическогоЛица.Женский, "ая", "ый");
		ТаблицаРезультат.Вывести(ОбластьМакета);
		
	КонецЦикла;
	
	//СтруктураОбластейПечатнойФормы = Новый Структура;
	//СтруктураОбластейПечатнойФормы.Вставить("Заголовок", );
	//СтруктураОбластейПечатнойФормы.Вставить("Вступление", );
	
	Возврат ТаблицаРезультат;
	
КонецФункции
