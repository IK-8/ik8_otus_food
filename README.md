# ik8_otus_food
Проект по домашнему заданию OTUS.

Цель:
Добавить в приложение возможность создать снимок и сохранить к рецепту. Выполнить идентификацию и выделение границ объектов с использованием TensorFlow Lite. Добавить анимации переходов между страницами, стороннюю анимацию пульсации пиктограммы сердца, изменение размера кнопки при нажатии.
## Заlача 4
Добавить навигацию между страницами (с передачей аргументов при переходе на страницу с подробностями рецептов) и анимацию переходов между страницами (в соответствии с дизайном в фигма)
Добавить анимацию размера checkbox при нажатии (пульсация до увеличенного и возврат в исходное состояние, одновременно с постановкой - снятием отметки)
Подключить внешнюю анимацию для пиктограммы сердца (несколько пульсаций, необходимо реализовать в Rive)
Реализовать получение изображения с камеры (действие "добавить изображение в рецепт"), сохранить его в локальную базу данных и отобразить на странице рецепта галерею (с возможностью полноэкранного просмотра)
С использованием COCO SSD MobileNet v1 и Tensorflow Lite выполнить определение объектов на сцене и добавить к локальному описанию изображения (с отображением обнаруженных объектов прямоугольника поверх изображения с указанием класса, по аналогии с https://www.tensorflow.org/lite/examples/object_detection/overview)

## Критерии оценки:
Сделана навигация и анимация переходов между страницами - 2 балла
Реализована анимация checkbox - 1 балл
Реализована внешняя анимация сердца - 2 балла
Поддерживается получение изображения с камеры и добавление в рецепт - 2 балла
Поддерживается детектирование объектов и отображение поверх изображения - 2 балла
Форматирование кода выполнено в соответствии с правилами Dart - 1 балл
Работа принята, если получено 6 или более баллов
