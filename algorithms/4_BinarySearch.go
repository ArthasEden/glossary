package algorithms

/*
Бинарный поиск - 7,4%

Можно разделить элементы на хорошие и плохие?
│
├── Нет → Другая тема
│
└── Да
    │
    ├── В ответе нужен диапазон или доп. подготовка?
        │
        ├── Да → Двойной бинарный поиск
        │
        └── Нет → Базовый бинарный поиск
*/

/*
Базовый бинарный поиск 60%

Время: O(log(n))
Память: O(1)

Пример: Найти индекс числа в отсортированном массиве
Вход: nums = [1,2,4,6,10], target = 6
Выход: 3

Флаги:
1. Дан отсортированный массив с задачей найти число
*/
func binarySearch(nums []int, target int) int {
	if len(nums) == 0 {
		return -1
	}

	l, r := 0, len(nums)-1

	for l <= r {
		m := l + (r-l)/2

		if nums[m] == target {
			return m
		} else if nums[m] < target {
			l = m + 1
		} else {
			r = m - 1
		}
	}

	return -1
}

/*
Двойной бинарный поиск 40%

Время: O(log(n))
Память: O(1)

Пример: Найти первый и последний индекс вхождения числа в отсортированном массиве
Вход: nums = [1,2,2,2,3,4], target = 2
Выход: [1,3]

Флаги:
1. Нужно найти диапазон значений
2. Нужен предварительный бинарный поиск, чтобы запустить основной
*/
// 1. Поиск первого вхождения
func searchFirst(nums []int, target int) int {
	l, r := 0, len(nums)-1
	res := -1

	for l <= r {
		m := l + (r-l)/2

		if nums[m] >= target {
			r = m - 1
		} else {
			l = m + 1
		}

		if nums[m] == target {
			res = m
		}
	}
	return res
}

// 2. Поиск последнего вхождения
func searchLast(nums []int, target int) int {
	l, r := 0, len(nums)-1
	res := -1

	for l <= r {
		m := l + (r-l)/2

		if nums[m] <= target {
			l = m + 1
		} else {
			r = m - 1
		}

		if nums[m] == target {
			res = m
		}
	}
	return res
}

// 3. Обработка результатов
func searchRange(nums []int, target int) []int {
	if len(nums) == 0 {
		return []int{-1, -1}
	}
	return []int{searchFirst(nums, target), searchLast(nums, target)}
}
