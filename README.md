## Projects & Workshops Overview

### 1. Website Boilerplate Creation
A foundational workshop focusing on terminal navigation, file system manipulation, and automation using Bash commands (`mkdir`, `touch`, `mv`, `rm`, `cp`) to build a standard web project structure.
- **Directory Structure**:
  * `src/`: Core website logic containing `index.html`, `index.js`, and `styles.css`.
  * `assets/`: Media and static resources categorized into subdirectories:
    * `fonts/`: Typography assets (`.ttf`, `.woff`).
    * `icons/`: Vector and UI icons (`.svg`).
    * `images/`: Raster image files (`.jpg`, `.jpeg`, `.png`).
- **Key Skills Practiced**: Relative and absolute directory navigation, nested folder generation, file extension/format refactoring, and directory restructuring.

---

### 2. Five Bash Programs
A suite of interactive command-line scripts designed to demonstrate core scripting concepts, including user input processing, loop structures, conditionals, arithmetic evaluation, and modular script execution.
- **`questionnaire.sh`**: Captures user input interactively via `read` prompts and outputs formatted variable strings.
- **`countdown.sh`**: Uses argument handling (`$1`) with input validation and a decremental `while` loop paired with `sleep 1` intervals.
- **`bingo.sh`**: Generates a pseudo-random integer (`1–75`) using `$RANDOM` and classifies the output into standard Bingo columns (`B`, `I`, `N`, `G`, `O`) via multi-branch conditional evaluations (`if`/`elif`/`else`).
- **`fortune.sh`**: Utilizes reusable function declarations, array indexing, and regular expression validation within an `until` loop (`\?$`) to enforce question formatting.
- **`five.sh`**: Acts as a central controller orchestrating sequential execution of all four child programs with positional parameters.

---

### 3. Mario Database (PostgreSQL)
A relational database designed to track Nintendo characters, physical traits, sound clips, and action capabilities.

#### Schema & Architecture
- **`characters`**: Primary character entity storing identification, name, homeland, and signature color.
- **`more_info`**: Represents a **One-to-One (1:1)** relationship with `characters` using a unique foreign key constraint (`character_id UNIQUE`) to store biological and physical metrics (birthday, height, weight).
- **`sounds`**: Implements a **One-to-Many (1:N)** relationship linking multiple audio assets (e.g., `its-a-me.wav`, `yahoo.wav`) to specific character entities.
- **`actions` & `character_actions`**: Implements a **Many-to-Many (N:M)** relationship between characters and available moves (`run`, `jump`, `duck`) using a composite primary key (`PRIMARY KEY (character_id, action_id)`) on the junction table.

#### SQL & Modeling Skills
- DDL constraint enforcement: `PRIMARY KEY`, `FOREIGN KEY ... REFERENCES`, `UNIQUE`, and `NOT NULL`.
- Sequence generation and `SERIAL`-equivalent auto-incrementing integer keys.
- Data integrity types including `numeric(4,1)`, `date`, `varchar`, and nullability handling.

---

### 4. Student Database & Automation (Part 1)
A relational academic database built in PostgreSQL paired with an automated Bash ingestion pipeline to parse, transform, and load CSV data while enforcing referential integrity.

#### Schema & Architecture
- **`majors`**: Defines degree programs (e.g., Database Administration, Data Science, Web Development) with auto-incrementing surrogate keys.
- **`courses`**: Catalog of curriculum offerings (e.g., Data Structures and Algorithms, SQL, Machine Learning).
- **`students`**: Stores student profiles, tracking `first_name`, `last_name`, academic performance via a `numeric(2,1)` fixed-point `gpa`, and an optional foreign key (`major_id`) allowing `NULL` values to support undeclared majors.
- **`majors_courses`**: Junction table implementing a **Many-to-Many (N:M)** relationship between majors and courses, secured by a composite primary key (`PRIMARY KEY (major_id, course_id)`) and dual foreign key constraints.

#### Automated ETL Pipeline (`insert_data.sh`)
- **Pipeline Orchestration**: Uses Bash with internal PostgreSQL client subshells (`psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c`) to automate database migrations and data entry.
- **Batch Initialization**: Executes a complete table reset using `TRUNCATE students, majors, courses, majors_courses` before processing input files.
- **Delimited File Parsing**: Processes comma-separated feeds (`courses.csv` and `students.csv`) line-by-line via `while IFS=',' read` loops while stripping CSV header rows.
- **Idempotent Inserts & Dynamic Key Resolution**:
  * Queries database records dynamically before insertion to prevent duplicate records.
  * Retrieves generated foreign keys (`major_id`, `course_id`) on the fly to populate relational links in `majors_courses`.
  * Handles missing/unmatched foreign key values by dynamically injecting SQL `null` literals into the database insert payloads.
    
---

### 5. Student Database & Advanced Query Analytics (Part 2)
An analytics-focused continuation leveraging PostgreSQL and Bash scripting (`student_info.sh`) to perform complex SQL reporting, multi-table joins, pattern matching, aggregate computations, and subquery filtering on academic records[cite: 15, 16].

#### Analytics Script (`student_info.sh`)
* **Shell-Integrated SQL Client**: Executes parameterized, non-aligned queries directly into PostgreSQL subshells (`psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c`) to parse and output query results straight to stdout[cite: 16].
* **Filter Conditions & Pattern Matching**:
  * Case-insensitive matching using `ILIKE` and wildcards (e.g., `ILIKE '%sa%'` or single-character wildcards `LIKE '%r_'`)[cite: 16].
  * Alphabetical range comparisons on string data types (e.g., `course < 'D'`, `last_name >= 'R'`)[cite: 16].
  * Boolean logic combinations (`AND`, `OR`) alongside `IS NULL` checking to query students without declared majors[cite: 16].
* **Aggregation & Group-Level Filtering**:
  * Precision aggregate functions such as `ROUND(AVG(gpa), 2)` to calculate summary statistics[cite: 16].
  * Multi-column groupings using `GROUP BY major_id` combined with post-aggregation conditions via `HAVING COUNT(*) > 1`[cite: 16].
* **Multi-Table Relational Joins**:
  * `LEFT JOIN` operations across `majors` and `students` to identify orphan records (majors with zero declared students) alongside active student matches[cite: 16].
  * Multi-table `FULL JOIN` and `INNER JOIN` pipelines chaining `courses`, `majors_courses`, `majors`, and `students` with `USING(key)` syntax to track enrollment distributions and isolate single-enrollment classes (`HAVING COUNT(student_id) = 1`)[cite: 16].
  * Deduplication and sorting via `DISTINCT`, `ORDER BY ... DESC`, and pagination throttling using `LIMIT 5`[cite: 16].
