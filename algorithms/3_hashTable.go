package algorithms

import "strings"

/*
Хэш-таблицы - 17%

Строка палиндром -> Каждая буква встречается четное число раз "AABBAA" -> "AABBAA" ||
					Каждая буква встречается чётное число раз кроме одной "AAB"-> "ABA" -> Не болеe одного символа встречается нечётное число раз

Нужна сортировка по частоте/топ-k?
│
├── Да → KV-VK
│
└── Нет
    │
    ├── Задача на аннаграмму/подсчёт?
        │
        ├── Да → техника подсчёта
        │
        └── Нет → подумать, что ключ, а что значение по смыслу:
				(Значение в массиве -> число повторений,
				Символ в строке -> число повторений,
				Значение в массиве -> индекс массива,
				Символ в строке -> соответствующий символ другой строки,
				Номер строки/столбца/диагонали -> количество элементов/сами элементы)
*/

/*
Техника подсчёта - 38%

Время: O(n)
Память: O(k), где k - кол-во уникальных символов

Пример:
Вход: s = "AAB"
Выход: true

Флаги:
1. Задачи на анаграммы. Анаграмма — это слово или фраза, образованная путём перестановки букв другого слова или фразы, например "listen" → "silent"
2. Работа с частотой элементов
*/
func isPalindromePermutation(s string) bool {
	count := make(map[rune]int)

	for _, char := range s {
		count[char]++
	}

	oddCount := 0
	for _, freq := range count {
		if freq%2 == 1 {
			oddCount++
		}
	}

	return oddCount <= 1
}

/*
Выбор ключа - 52%

Время: O(n)
Память: O(k), где k — количество уникальных ключей

Пример:
Вход: words = ["apple","banana","apple","orange","banana","apple"]
Выход: map[string]int{"apple":3,"banana":2,"orange":1}

Флаги:
1. Нужно выбрать, что будет ключом в хэш-таблице для подсчёта/группировки
2. Типично: значение массива, символ строки, индекс, остаток от деления, составной ключ
3. Реализация требует определить ключ и использовать его для мапы
*/
func chooseKey(words []string) map[string]int {
	counts := make(map[string]int)
	for _, word := range words {
		counts[word]++
	}
	return counts
}

/*
KV-VK - 14,3%

Время: O(n)
Память: O(n)

Пример:
Вход: s = "tree"
Выход: "eert"

Флаги:
1. Задача на сортировку по частотности
2. Нужно искать топ-k по некоторому свойству
*/
func frequencySort(s string) string {
	count := make(map[rune]int)
	for _, char := range s {
		count[char]++
	}

	freqList := make([][]rune, len(s)+1)
	for char, freq := range count {
		freqList[freq] = append(freqList[freq], char)
	}

	var result strings.Builder
	for freq := len(freqList) - 1; freq > 0; freq-- {
		for _, char := range freqList[freq] {
			for i := 0; i < freq; i++ {
				result.WriteRune(char)
			}
		}
	}

	return result.String()
}
