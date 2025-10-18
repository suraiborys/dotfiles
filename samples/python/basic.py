"""
Sample Python script for testing nvim-dap debugging features.

This script demonstrates:
- Basic breakpoints and stepping (step over, step into, step out)
- Variable inspection (primitives, lists, dicts, objects)
- Conditional breakpoints (useful in loops)
- Exception handling and exception breakpoints
"""


class Person:
    """Simple class for testing object inspection."""

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def greet(self):
        return f"Hello, I'm {self.name} and I'm {self.age} years old"


def calculate_sum(a, b):
    """Simple function for testing step into."""
    result = a + b
    return result


def process_numbers(numbers):
    """Function demonstrating variable inspection with different data types."""
    # Primitives
    count = len(numbers)
    total = 0

    # List
    doubled = [n * 2 for n in numbers]

    # Dictionary
    stats = {
        "count": count,
        "min": min(numbers) if numbers else 0,
        "max": max(numbers) if numbers else 0,
    }

    # Loop - good place for conditional breakpoints (e.g., break when i == 5)
    for i, num in enumerate(numbers):
        total += num
        if num % 2 == 0:
            print(f"Found even number: {num} at index {i}")

    stats["total"] = total
    stats["average"] = total / count if count > 0 else 0

    return doubled, stats


def demonstrate_exceptions():
    """Function for testing exception breakpoints."""
    data = [1, 2, 0, 4, 5]

    for i, value in enumerate(data):
        try:
            # This will raise ZeroDivisionError when value is 0
            result = 10 / value
            print(f"10 / {value} = {result}")
        except ZeroDivisionError:
            print(f"Cannot divide by zero at index {i}")
        except Exception as e:
            print(f"Unexpected error: {e}")


def main():
    """Main entry point - set breakpoint here and step through."""
    print("=== Starting Debug Demo ===")

    # Test basic stepping and function calls
    x = 5
    y = 10
    sum_result = calculate_sum(x, y)
    print(f"Sum: {sum_result}")

    # Test variable inspection with collections
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    doubled, stats = process_numbers(numbers)
    print(f"Doubled: {doubled}")
    print(f"Stats: {stats}")

    # Test object inspection
    person = Person("Alice", 30)
    greeting = person.greet()
    print(greeting)

    # Test exception handling
    print("\n=== Testing Exception Handling ===")
    demonstrate_exceptions()

    print("\n=== Debug Demo Complete ===")


if __name__ == "__main__":
    main()
