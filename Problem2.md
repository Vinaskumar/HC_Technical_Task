# Problem 2: Data Cleaning and Merging Steps

## 1. Removing Duplicates

The `drop_duplicates` method is used to remove duplicate rows based on the `email` column. The `keep='first'` argument ensures that only the first occurrence of each email is kept. This approach ensures that the final dataset contains unique emails, and duplicates are removed systematically.

## 2. Address Extraction

Address components are extracted from a single address string. This involves separating the street address, city, state, and zip code.

## 3. Data Merging

To handle the scenario where `persons_data['majors']` contains comma-separated values, we need to split these values, match them with the `majors_data['name']`, and then join the `id` values from `majors_data`. Here's how it's done:

1. Split the comma-separated majors.
2. Match these majors with `majors_data['name']`.
3. Collect the corresponding `id` values.

## 4. Save Final Data

The final cleaned and merged data is exported to `final_data.csv`.
