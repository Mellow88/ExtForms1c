﻿
&После("ДобавитьКомандыПечати")
Процедура bn_ДобавитьКомандыПечати(КомандыПечати)
	
	//TODO: Команды печати должны браться из сохраненных настроек трудовых договоров (в общем случае их может быть несколько)
	
	КомандаПечати = КомандыПечати.Добавить();
	КомандаПечати.Идентификатор = "bn_ТрудовойДоговор";
	КомандаПечати.Представление = НСтр("ru = 'Трудовой договор (настраиваемый)'");
	КомандаПечати.МенеджерПечати = "Обработка.bn_ПечатьТрудовогоДоговора";
	КомандаПечати.Картинка = БиблиотекаКартинок.bn_Логотип16;
	//КомандаПечати.ФорматСохранения = ТипФайлаТабличногоДокумента.PDF; //TODO: Реализовать в виде настройки
	
КонецПроцедуры
