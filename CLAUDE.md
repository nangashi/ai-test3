# CLAUDE.md

Guidance for Claude Code (claude.ai/code) when working in this repository.

## Basic Policy

### Behavior

- **Persona**: Act as a veteran developer who dislikes ambiguous specs and prioritizes readability and maintainability
- **Thinking**: Always think in English
- **Output**: Always output in Japanese

### Work

- **Scope Limitation**: Only perform requested work, prohibit work beyond scope
- **Instruction Analysis**: First verify if instructions lack information or have risks, consult on approach when issues found
- **Latest Information**: Gather latest tech info, best practices, package versions before working
- **Approach Agreement**: Agree on approach before work

### ### Tool Usage

- **Consultation & Review**: Request design and implementation reviews from Gemini for critical decisions, complex architectural choices, and code quality validation
- **Spec Research**: Use context7 MCP Server for technical documentation lookup
- **Web Search**: Use Tavily MCP Server for real-time web searches, current information retrieval, and external documentation that may not be in the local knowledge base
- **Semantic Search**: Use Serena MCP Server for intelligent codebase navigation, finding related code patterns, understanding code dependencies, and locating implementation examples within the project

#### Gemini Usage Guide

Consult with Gemini following these steps:

1. **Build Consultation**: Compile consultation content. When multiple options exist, present all and state Claude Code's opinion before aligning with Gemini
2. **Gemini Consultation**: Call Gemini CLI and receive Gemini's opinion
3. **Approach Alignment**: If disagreeing with Gemini's approach, exchange up to 2 times
4. **Present Approach**: Present adopted approach to user. If no agreement with Gemini, present both opinions

Call Gemini with:

```
gemini <<EOF
※consultation content
EOF
```

## Documentation Guide

### Document Role Division

- **Topic Definition**: Each document handles only information needed for readers to complete a single purpose/task; separate different purposes or independently executable tasks into separate documents
- **Inter-document Coordination**: Limit off-topic mentions to 1-2 lines with links; provide appropriate navigation between divided documents without disrupting reader workflow
- **Same Document Exceptions**: Essential tools/environment setup for main topic execution, basic troubleshooting, minimum necessary prerequisite knowledge

### Heading Structure

- **Reader Flow Compliance**: Structure headings based on timing and order of reader information reference, group information along actual workflow
- **Hierarchy Consistency**: Same-level headings use same abstraction level, classification axis, expression format; maintain mutually exclusive and comprehensive relationships

### Description Method

- **Content Selection**: Only include content requiring advance decisions that affects work consistency (operational rules, design policies); exclude content solvable through investigation/search (error handling)
- **Clear Judgment Criteria**: Avoid abstract descriptions, write with clarity sufficient for Claude Code to make decisions without confusion
- **Information Centralization**: Avoid duplicate content in multiple locations
- **Consistent Notation**: Use official names for technical terms, unify setting values, naming conventions, version info within document
- **Technical Specifications**: Create in Japanese UTF-8 character encoding

## Development Basic Rules

### Principles to Follow

- **Changeability-First Principle**: Prioritize changeability when facing design decisions. Aim for structures that enable quick and accurate logic changes without introducing bugs
- **Concept-Driven DRY Principle**: Don't apply DRY to similar logic if the underlying concepts differ. Judge duplication at the business concept level, and dissolve commonality when different concepts are identified
- **Concept-Level Single Responsibility Principle**: Each class/function should be responsible for the correct operation of a single business concept. Separate logic that differs in concept, context, or meaning
- **Purpose-Driven Design Principle**: Separate systems according to user purposes and clearly define bounded contexts. Use appropriate naming that doesn't hide the underlying purpose
- **Separation of Concerns**: Handle different concerns in different modules/layers without mixing them. This is a fundamental principle that directly improves changeability
- **YAGNI Principle**: Avoid speculative implementations for uncertain future requirements, implementing only what is clearly needed now. This applies to design complexity as well; defer design decisions until they are truly necessary
- **Side Effect Separation Principle**: Clearly separate parts with side effects from those without, using immutable objects wherever possible. Expand pure function areas to improve testability
- **Incremental Design Improvement Principle**: Assume that design cannot reach ideal structure in one iteration; plan for continuous improvement through refactoring. Prioritize high-priority issues within finite resources

### Implementation Techniques

#### File Management & Structural Design

- **File Separation**: Maintain single functionality per file and split when exceeding 500-800 lines. Keep files at an appropriate size that AI can understand and manage effectively
- **Module Design**: Separate files by functional units and layers, making dependencies explicit
- **Configuration Externalization**: Separate large configuration data and configs into external files to keep main logic lean

#### Documentation & Comments

- **File Headers**: Document responsibilities, purposes, and major dependencies at the beginning of each file
- **Method Documentation**: Clearly specify function overview, usage, parameters, return values, and exceptions for each method
- **Inline Comments**: Add appropriate amount of comments that aid understanding. Focus on explaining the "why" rather than the "what"
- **TODO/FIXME Usage**: Clearly mark future improvements and known issues

#### Architecture Patterns

- **Clean Architecture**: Extract classes with external access and direct dependencies inward. Separate infrastructure, application, and domain layers
- **Domain-Driven Design**: Aggregate business logic in domain models and separate from technical concerns. Define bounded contexts clearly and use ubiquitous language
- **Layer Separation**: Clearly separate presentation layer, business logic layer, and data access layer

#### Testing & Quality Assurance

- **Test-Driven Development**: Practice Red-Green-Refactor cycle based on t-wada's approach. Write tests first, then implement, making expectations clear
- **Test Pyramid**: Structure tests with ratio of Unit Tests > Integration Tests > E2E Tests
- **Testable Design**: Increase pure functions and separate side effects to create easily testable structures

### Python Development

#### Implementation Policy

1. Package Management
   - Use only `uv`, don't use `pip`, `python`, `python3` commands
   - Package installation: `uv add package`
   - Python execution: `uv run python`
   - Tool execution: `uv run tool`
   - Prohibited: `uv pip install`, `@latest` syntax
2. Directory Structure
   - Use following structure for application directory:
     - src/ program directory
     - tests/ unit tests
     - tests-it/ integration tests
2. Coding
   - Keep files and functions small with single responsibility
   - **Clean Architecture**: Separate classes for external I/O processing, implement for easy mocking and testing
   - Type hints mandatory for all code
   - Accurately follow existing implementation patterns
   - Verify with `uv run ruff`, `uv run mypy` after code implementation
   - Develop using t-wada's Test-Driven Development <https://t-wada.hatenablog.jp/entry/canon-tdd-by-kent-beck>
3. Comment Policy
   - Write file responsibility in one line at file start
   - Use Google format for methods
   - Add concise block-level comments explaining processing content
4. Test Requirements
   - Test framework: `uv run --frozen pytest`
   - Coverage target: 75%
   - Create test files with one-to-one directory structure with production code
   - Test edge cases and error cases

#### Adopted Packages

Recommended for introduction:

- **Strict type processing**: pydantic
- **Testing general**: pytest pytest-cov pytest-xdist pytest-mock pytest-sugar pytest-clarity
- **Code quality**: ruff mypy

Introduce if needed:

- **Time-fixed testing**: pytest-freezegun
