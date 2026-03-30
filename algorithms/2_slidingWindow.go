package algorithms

import "strconv"

/*
Плавающее окно - 9,6%

Упоминание фиксированной длины окна?
│
├── Да → окно фиксированной длины
│
└── Нет
    │
    ├── Потенциаальные ответы пересекаются?
        │
        ├── Да → пересекающиеся окна
        │
        └── Нет → непересекающиеся окна
*/

/*
Окно фиксированной длины - 14,3%

Время: O(n)
Память: O(1)

Пример: Найти сумму k подряд идущих элементов с максимальной суммой
Вход: nums = [1,2,3,4,5], k = 2
Выход: 9

Флаги:
1. Дана переменная, обозначающая размер окна
2. Требуется работать с подряд идущими элементами
*/
func kElementsMaxSum(nums []int, k int) int {
	if len(nums) == 0 || k > len(nums) {
		return 0
	}

	windowSum := 0
	for i := 0; i < k; i++ {
		windowSum += nums[i]
	}

	maxSum := windowSum

	for r := k; r < len(nums); r++ {
		l := r - k
		windowSum = windowSum + nums[r] - nums[l]
		if windowSum > maxSum {
			maxSum = windowSum
		}
	}
	return maxSum
}

/*
Непересекающиеся окна - 58,1%

Время: O(n)
Память: O(n)

Пример: Сжать последовательные числа в диапазоны
Вход: nums = [0,1,2,4,5,7]
Выход: ["0->2","4->5","7"]

Флаги:
1. Нужно работать с подряд идущими группами элементов
2. Один элемент принадлежит одной группе (групы не пересекаются)
*/
func compressRanges(nums []int) []string {
	if len(nums) == 0 {
		return []string{}
	}

	l := 0
	r := 0
	result := make([]string, 0)

	for l < len(nums) {
		for r+1 < len(nums) && nums[r]+1 == nums[r+1] {
			r++
		}

		if r != l {
			result = append(result, strconv.Itoa(nums[l])+"->"+strconv.Itoa(nums[r]))
		} else {
			result = append(result, strconv.Itoa(nums[l]))
		}

		l = r + 1
		r = r + 1
	}
	return result
}

/*
Пересекающиеся окна - 28,6%

Время: O(n)
Память: O(1)

Пример: Найти максимальную длину подмассива из 1, заменяя не более k нулей
Вход: nums = [1,0,1,1,0,1], k = 1
Выход: 4

Флаги:
1. Нужно работать с подряд идущими группами элементов
2. Один эелмент принадлежит одной групппе (группы пересекаются)
*/
func longestOneWithFlips(nums []int, k int) int {
	l := 0
	result := 0
	zeroCount := 0

	for r := 0; r < len(nums); r++ {
		if nums[r] == 0 {
			zeroCount++
		}

		for zeroCount > k {
			if nums[l] == 0 {
				zeroCount--
			}
			l++
		}

		if r-l+1 > result {
			result = r - l + 1
		}
	}
	return result
}
