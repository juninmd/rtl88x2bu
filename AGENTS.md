```markdown
# AGENTS.md File Guidelines

These guidelines are designed to ensure high-quality, maintainable, and robust code for the AGENTS repository. Adherence to these principles will significantly improve the overall development process.

## 1. DRY (Don't Repeat Yourself)

*   All code should be encapsulated within single, well-defined functions and classes.
*   Avoid duplication of logic and data.
*   When a similar task is performed repeatedly, create a reusable function or class.
*   Leverage existing design patterns where appropriate.

## 2. KISS (Keep It Simple, Stupid)

*   Code should be as concise as possible while maintaining readability and functionality.
*   Favor simple solutions over complex ones.
*   Use clear and understandable variable names.
*   Break down complex tasks into smaller, manageable functions.

## 3. SOLID Principles

*   **Single Responsibility Principle:** Each class/module should have a single, well-defined responsibility.
*   **Open/Closed Principle:** The system should be extensible without modifying the existing code.  New features should be added through new classes/modules, not by modifying existing ones.
*   **Liskov Substitution Principle:**  Subclasses should be substitutable for their base classes without altering the correctness of the program.
*   **Interface Segregation Principle:** Clients shouldn't be forced to depend on methods they don't use.
*   **Dependency Inversion Principle:** High-level modules should be dependent on low-level modules, which in turn should be dependent on module interactions.

## 4. YAGNI (You Aren't Gonna Need It)

*   Avoid introducing unnecessary code.
*   Focus on implementing the essential functionality required for the current task.
*   Refactor code to remove any unused functionality.
*   Don’t add features just because they might be useful in the future.

## 5. Code Structure & Formatting

*   **File Size Limit:** Each file should not exceed 180 lines of code.
*   **Naming Conventions:**
    *   Functions: Use snake\_case (e.g., `process_data`, `validate_input`).
    *   Classes: Use CamelCase (e.g., `Agent`, `DataStore`).
    *   Variables: Use descriptive names (e.g., `user_id`, `transaction_amount`).
    *   Constants: Use uppercase letters (e.g., `DEFAULT_TIMEOUT`, `MAX_CONNECTIONS`).
*   **Comments:** Provide concise and helpful comments where necessary, but avoid over-commenting.  Focus on explaining *why* the code is written a certain way, not just *what* it does.
*   **Code Structure:** Organize code logically, using appropriate grouping and separation of concerns.  Follow established coding styles (e.g., PEP 8 for Python).

## 6. Testing & Coverage

*   **Unit Tests:** All code should be thoroughly tested with unit tests.
*   **Test Coverage:** Aim for at least 80% code coverage.
*   **Test Types:** Utilize a variety of test types (e.g., integration tests, edge case tests, performance tests).
*   **Mocking:**  Only use mocks for unit tests.  Avoid using real external dependencies.

## 7. File Structure

*   **`src/` Directory:** All source code should reside within the `src/` directory.
*   **`tests/` Directory:** All test files should reside within the `tests/` directory.
*   **`docs/` Directory:**  Documentations should reside within the `docs/` directory.
*   **`README.md`:** A README file explaining the purpose of the project, including the guidelines above.

## 8.  Specific File Structure Example (Illustrative)

*   `src/Agent.py`:  Contains core Agent logic and data structures.
*   `src/DataStore.py`: Manages data storage, persistence, and retrieval.
*   `src/Algorithms.py`:  Defines algorithms and data processing routines.
*   `src/Tests/UnitTests.py`: Contains unit test files.
*   `src/docs/index.md`:  A starting point for documentation.

## 9.  Automated Checks

*   Code style checks using `flake8` or `pylint` (if applicable).
*   Linters to enforce basic formatting rules.
*   Static analysis to detect potential bugs.

By adhering to these guidelines, we aim to create a consistently high-quality and maintainable AGENTS repository.  Regular review and updates are encouraged.
```