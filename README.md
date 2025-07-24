# Processo seletivo do Grupo Adriano Cobuccio
Desenvolvimento de um projeto para pesquisa de criptomoedas por meio de uma API externa, permitindo que o usuário favorite ativos localmente para acessá-los com mais facilidade, além de oferecer a visualização detalhada de suas informações por meio de gráficos interativos.

# Business Rules

1. If the customer selects a sandwich, fries, and soft drink, then the customer will have 20%
discount.
2. If the customer selects a sandwich and soft drink, then the customer will have 15% discount.
3. If the customer selects a sandwich and fries, then the customer will have a 10% discount.
4. Each order cannot contain more than one sandwich, fries, or soda. If two identical items are
sent, the APP should return an error message displaying the reason.

## Products
1. X Burger – $ 5,00
2. X Egg - $ 4,50
3. X Bacon - $ 7,00
4. Fries - $ 2,00
5. Soft drink - $ 2,50

# Architecture

This module follows an architecture based on Clean Architecture, with adaptations to maintain simplicity and modularity. The structure is replicated across all project modules, following the pattern below:

```
<module_name>/
├── domain/
│   ├── entities/
│   └── repository/
│   └── usecases/
├── infra/
│   ├── datasource/
│   └── repository/
├── external/
│   ├── converters/
│   └── datasource/
├── presentation/
│   └── pages/
│       ├── <screen_name>/
│       │   ├── <screen_name>_page.dart
│       │   ├── widgets/
│       │   └── store/
│       └── ...
```

## Module Layers

### `domain/`
Contains the entities and repository contracts, fully isolated from external dependencies.

### `infra/`
Implements the repositories defined in the domain and handles communication with data sources (such as APIs or local databases).

### `external/`
Bridges the module with the external environment. Includes the data source implementations and converters between models and entities.

### `presentation/`
Responsible for the user interface and state management. Directly consumes the repositories.

This organization promotes separation of concerns, code reusability, and simplifies testing and maintenance in medium to large-scale projects.

## Modules
These modules encapsulate the core features of the application. Each module follows a clean, modular structure that promotes separation of concerns, ease of testing, and scalability.

### MenuModule
Handles the functionality for retrieving the application's product menu, as well as adding and removing items from the cart. Each function includes a sleep() call to simulate the latency of an asynchronous request.

### PaymentModule
Handles the simulation of a payment transaction.

# Packages Used
These are the main packages used throughout the project to support architecture, navigation, state management, and functional programming. Each one was chosen to promote clean code, scalability, and maintainability.

## Dependency Injection and State Management (**flutter_bloc**)
The project uses flutter_bloc to manage both state and dependency injection. Using the Bloc pattern, it organizes business logic around events (which represent user actions or external inputs) and states (which represent the UI’s condition). BlocProvider handles dependency injection, while the clear event-to-state flow ensures predictable and testable state management.

## Navigation (**go_router**)
The project uses **go_router** for handling navigation. This package simplifies route management with declarative routing, deep linking support, and easy integration with Flutter’s navigation system, making navigation more predictable and maintainable.

## Functional Programming and Safe Flow with Either (**dartz**)
We use the **dartz** library to apply functional programming concepts, highlighting the **Either** class. It represents failures and successes in a safe and explicit way, avoiding exceptions and ensuring proper error handling, which makes the code cleaner, more predictable, and easier to test.

