CREATE TABLE [dbo].[book_master_tbl]
(
	[book_Id] NCHAR(10) NOT NULL PRIMARY KEY, 
    [book_name] NVARCHAR(MAX) NULL, 
    [genre] NVARCHAR(MAX) NULL, 
    [author_name] NVARCHAR(MAX) NULL, 
    [publisher_name] NVARCHAR(MAX) NULL, 
    [publish_date] NVARCHAR(50) NULL, 
    [language] NVARCHAR(50) NULL, 
    [edition] NVARCHAR(MAX) NULL, 
    [book_cost] NCHAR(10) NULL, 
    [no_of_pages] NCHAR(10) NULL, 
    [book_description] NVARCHAR(MAX) NULL, 
    [actual_stock] NCHAR(10) NULL, 
    [current_stock] NCHAR(10) NULL, 
    [book_image_link] NVARCHAR(MAX) NULL
)
