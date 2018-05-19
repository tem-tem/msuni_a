# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180519153445) do

  create_table "Clients", primary_key: "ID_Client", id: :integer, default: nil, force: :cascade do |t|
    t.string "LastName_Cl", limit: 30, null: false
    t.string "FirstName_Cl", limit: 30, null: false
    t.string "Phone_Cl", limit: 20, null: false
    t.text "Adress_Cl", null: false
    t.text "Email_Cl", null: false
  end

  create_table "Managers", primary_key: "ID_Manager", id: :integer, default: nil, force: :cascade do |t|
    t.string "LastName_Mn", limit: 30, null: false
    t.string "FirstName_Mn", limit: 30, null: false
    t.integer "Salary_Mn"
    t.integer "WorkHours_Mn", null: false
    t.integer "NeedHours_Mn", null: false
    t.string "Phone_Mn", limit: 20, null: false
  end

  create_table "Orders", primary_key: "ID_Order", id: :integer, default: nil, force: :cascade do |t|
    t.integer "Price_Or", null: false
    t.datetime "Date_Or", precision: 7, null: false
    t.integer "manager_id"
    t.integer "client_id", null: false
  end

  create_table "Products", primary_key: "ID_Product", id: :integer, default: nil, force: :cascade do |t|
    t.string "Color_Pr", limit: 30, null: false
    t.string "Material_Pr", limit: 50, null: false
    t.string "Name_Pr", limit: 20, null: false
    t.string "Size_Pr", limit: 20, null: false
    t.string "Model_Pr", limit: 30, null: false
    t.integer "Quantity_Pr", null: false
  end

  create_table "ProductsToOrders", primary_key: "ID_pTo", id: :integer, force: :cascade do |t|
    t.integer "ID_Product", null: false
    t.integer "ID_Order", null: false
    t.integer "products_id", null: false
    t.integer "orders_id", null: false
  end

  create_table "ProductsToSupply", primary_key: "ID_pTs", id: :integer, force: :cascade do |t|
    t.integer "ID_Product", null: false
    t.integer "ID_Supply", null: false
    t.integer "product_id", null: false
    t.integer "supply_id", null: false
  end

  create_table "Products_New", primary_key: "ID_Product", id: :integer, default: nil, force: :cascade do |t|
    t.string "Color_Pr", limit: 30, null: false
    t.string "Material_Pr", limit: 50, null: false
    t.string "Name_Pr", limit: 20, null: false
    t.string "Size_Pr", limit: 20, null: false
    t.string "Model_Pr", limit: 30, null: false
    t.integer "Quantity_Pr", null: false
  end

  create_table "Purveyors", primary_key: "ID_Purveyor", id: :integer, default: nil, force: :cascade do |t|
    t.string "LastName_Pu", limit: 30, null: false
    t.string "FirstName_Pu", limit: 30, null: false
    t.string "Phone_Pu", limit: 20, null: false
    t.text "Email_Pu", null: false
  end

  create_table "STEM_Check", id: :integer, default: nil, force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "total_price"
  end

  create_table "STEM_CheckPosition", id: :integer, default: nil, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "check_id", null: false
    t.index ["game_id", "check_id"], name: "STEM_X_checkposition"
    t.index ["game_id", "check_id"], name: "UC_game_check", unique: true
  end

  create_table "STEM_Game", id: :integer, default: nil, force: :cascade do |t|
    t.varchar "title", limit: 100, default: "Game Title", null: false
    t.varchar_max "game_description"
    t.float "price", default: 0.0, null: false
    t.index ["title"], name: "STEM_X_title"
  end

  create_table "STEM_GameGenre", id: :integer, default: nil, force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "game_id", null: false
    t.index ["genre_id", "game_id"], name: "UC_genre_game", unique: true
  end

  create_table "STEM_Genre", id: :integer, default: nil, force: :cascade do |t|
    t.varchar "genre_name", limit: 50, null: false
    t.varchar_max "genre_description"
  end

  create_table "STEM_Pic", id: :integer, default: nil, force: :cascade do |t|
    t.integer "game_id", null: false
    t.varchar_max "link"
  end

  create_table "STEM_User", id: :integer, default: nil, force: :cascade do |t|
    t.varchar "user_login", limit: 40, null: false
    t.varchar "user_password", limit: 40, null: false
    t.varchar "email", limit: 60, null: false
    t.index ["user_login"], name: "STEM_X_user_login"
  end

  create_table "STEM_UserGame", id: :integer, default: nil, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "game_id", null: false
    t.boolean "liked"
    t.index ["user_id", "game_id"], name: "STEM_X_usergame"
    t.index ["user_id", "game_id"], name: "UC_user_game", unique: true
  end

  create_table "STEM_Vid", id: :integer, default: nil, force: :cascade do |t|
    t.integer "game_id", null: false
    t.varchar_max "link"
  end

  create_table "Supply", primary_key: "ID_Supply", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "Date_Su", precision: 7, null: false
    t.integer "Price_Su", null: false
    t.integer "managers_id", null: false
    t.integer "purveyors_id", null: false
  end

  create_table "_AccessLevel", id: :integer, force: :cascade do |t|
    t.string "tag", limit: 100, null: false
    t.integer "lvl", null: false
    t.index ["lvl"], name: "UQ___AccessL__DE10C0B42B8110B3", unique: true
    t.index ["tag"], name: "UQ___AccessL__DC101C0140909065", unique: true
  end

  create_table "_Genre", id: :integer, force: :cascade do |t|
    t.string "tag", limit: 100, null: false
    t.index ["tag"], name: "UQ___Genre__DC101C015D9769D1", unique: true
  end

  create_table "_Image", id: :integer, force: :cascade do |t|
    t.string "file", limit: 100, null: false
    t.integer "movie_id", null: false
    t.index ["movie_id"], name: "_Image_movie_id_b245ee65"
  end

  create_table "_Member", id: :integer, force: :cascade do |t|
    t.string "first_name", limit: 50, null: false
    t.string "last_name", limit: 50, null: false
    t.string "portrait", limit: 100
    t.string "role_in_movie", limit: 4, null: false
  end

  create_table "_Movie", id: :integer, force: :cascade do |t|
    t.string "title", limit: 150, null: false
    t.integer "duration", null: false
    t.text "movie_description", null: false
    t.date "release_date", null: false
    t.string "poster", limit: 100
    t.text "trailer_url", null: false
    t.boolean "suggested", null: false
    t.integer "access_lvl_id", null: false
    t.index ["access_lvl_id"], name: "_Movie_access_lvl_id_ba8405fa"
  end

  create_table "_MovieCard", id: :integer, force: :cascade do |t|
    t.boolean "watched", null: false
    t.boolean "want_to_watch", null: false
    t.boolean "is_favorite", null: false
    t.boolean "liked", null: false
    t.integer "movie_id", null: false
    t.integer "user_id", null: false
    t.index ["movie_id"], name: "_MovieCard_movie_id_bb33e276"
    t.index ["user_id", "movie_id"], name: "_MovieCard_user_id_movie_id_70930fdc_uniq", unique: true
    t.index ["user_id"], name: "_MovieCard_user_id_fe2513f2"
  end

  create_table "_MovieGenre", id: :integer, force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "movie_id", null: false
    t.index ["genre_id"], name: "_MovieGenre_genre_id_8e3f85bd"
    t.index ["movie_id", "genre_id"], name: "_MovieGenre_movie_id_genre_id_0ba29f64_uniq", unique: true
    t.index ["movie_id"], name: "_MovieGenre_movie_id_8dec3a33"
  end

  create_table "_MovieMember", id: :integer, force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "movie_id", null: false
    t.index ["member_id"], name: "_MovieMember_member_id_68cbcb05"
    t.index ["movie_id", "member_id"], name: "_MovieMember_movie_id_member_id_7da73386_uniq", unique: true
    t.index ["movie_id"], name: "_MovieMember_movie_id_2bad8f7f"
  end

  create_table "_PromoCode", id: :integer, force: :cascade do |t|
    t.string "code", limit: 15, null: false
    t.integer "quantity", null: false
    t.integer "subscription_id", null: false
    t.index ["code"], name: "UQ___PromoCo__357D4CF969CC55FA", unique: true
    t.index ["subscription_id"], name: "_PromoCode_subscription_id_8b76af06"
  end

  create_table "_Subscription", id: :integer, force: :cascade do |t|
    t.integer "duration", null: false
    t.integer "price", null: false
    t.boolean "visible", null: false
    t.integer "access_level_id", null: false
    t.index ["access_level_id"], name: "_Subscription_access_level_id_8447cc4f"
  end

  create_table "_User", id: :integer, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.datetime "last_login", precision: 7
    t.string "email", limit: 100, null: false
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.boolean "activated", null: false
    t.boolean "is_staff", null: false
    t.boolean "is_superuser", null: false
    t.date "subscribed_date", null: false
    t.string "lang", limit: 5, null: false
    t.integer "subscription_id"
    t.index ["email"], name: "UQ___User__AB6E61646CDA47B8", unique: true
    t.index ["subscription_id"], name: "_User_subscription_id_36f05012"
  end

  create_table "_UserPromoCode", id: :integer, force: :cascade do |t|
    t.boolean "is_active", null: false
    t.integer "promo_code_id", null: false
    t.integer "user_id", null: false
    t.index ["promo_code_id"], name: "_UserPromoCode_promo_code_id_db37b6e2"
    t.index ["user_id", "promo_code_id"], name: "_UserPromoCode_user_id_promo_code_id_64d6cf13_uniq", unique: true
    t.index ["user_id"], name: "_UserPromoCode_user_id_18d7fc0a"
  end

  create_table "_User_groups", id: :integer, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "_User_groups_group_id_0f6161de"
    t.index ["user_id", "group_id"], name: "_User_groups_user_id_group_id_76d57c82_uniq", unique: true
    t.index ["user_id"], name: "_User_groups_user_id_efa5f5c3"
  end

  create_table "_User_user_permissions", id: :integer, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "_User_user_permissions_permission_id_b1ef9d5e"
    t.index ["user_id", "permission_id"], name: "_User_user_permissions_user_id_permission_id_01abedb3_uniq", unique: true
    t.index ["user_id"], name: "_User_user_permissions_user_id_65ec8460"
  end

  create_table "auth_group", id: :integer, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.index ["name"], name: "UQ__auth_gro__72E12F1B61E4A074", unique: true
  end

  create_table "auth_group_permissions", id: :integer, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
  end

  create_table "auth_permission", id: :integer, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
  end

  create_table "django_admin_log", id: :integer, force: :cascade do |t|
    t.datetime "action_time", precision: 7, null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
  end

  create_table "django_content_type", id: :integer, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :integer, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.datetime "applied", precision: 7, null: false
  end

  create_table "django_session", primary_key: "session_key", id: :string, limit: 40, default: nil, force: :cascade do |t|
    t.text "session_data", null: false
    t.datetime "expire_date", precision: 7, null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
  end

  create_table "msu_books", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "msu_disciplines", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "msu_images", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.bigint "msu_lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["msu_lecture_id"], name: "index_msu_images_on_msu_lecture_id"
  end

  create_table "msu_lecture_books", force: :cascade do |t|
    t.bigint "msu_lectures_id"
    t.bigint "msu_books_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["msu_books_id"], name: "index_msu_lecture_books_on_msu_books_id"
    t.index ["msu_lectures_id"], name: "index_msu_lecture_books_on_msu_lectures_id"
  end

  create_table "msu_lectures", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "msu_discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["msu_discipline_id"], name: "index_msu_lectures_on_msu_discipline_id"
  end

  create_table "msu_presentations", force: :cascade do |t|
    t.string "title"
    t.boolean "visible"
    t.bigint "msu_lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pdf_filename"
    t.string "pptx_filename"
    t.index ["msu_lecture_id"], name: "index_msu_presentations_on_msu_lecture_id"
  end

  create_table "ssum", id: false, force: :cascade do |t|
    t.integer "summ"
  end

  create_table "sysdiagrams", primary_key: "diagram_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.integer "principal_id", null: false
    t.integer "version"
    t.binary "definition"
    t.index ["principal_id", "name"], name: "UK_principal_name", unique: true
  end

  add_foreign_key "Orders", "Clients", column: "client_id", primary_key: "ID_Client", name: "FK_Orders_Clients_ID_Client"
  add_foreign_key "Orders", "Managers", column: "manager_id", primary_key: "ID_Manager", name: "FK_Managers_Orders_ID_Order"
  add_foreign_key "ProductsToOrders", "Orders", column: "orders_id", primary_key: "ID_Order", name: "FK_ProductsToOrders_Orders_ID_Order"
  add_foreign_key "ProductsToOrders", "Products", column: "products_id", primary_key: "ID_Product", name: "FK_ProductsToOrders_Products_ID_Product"
  add_foreign_key "ProductsToSupply", "Products", column: "product_id", primary_key: "ID_Product", name: "FK_ProductsToSupply_Products_ID_Product"
  add_foreign_key "ProductsToSupply", "Supply", column: "supply_id", primary_key: "ID_Supply", name: "FK_ProductsToSupply_Supply_ID_Supply"
  add_foreign_key "STEM_Check", "STEM_User", column: "user_id", name: "FK__STEM_Chec__user___308EFFF0"
  add_foreign_key "STEM_CheckPosition", "STEM_Check", column: "check_id", name: "FK__STEM_Chec__check__3553B50D"
  add_foreign_key "STEM_CheckPosition", "STEM_Game", column: "game_id", name: "FK__STEM_Chec__game___345F90D4"
  add_foreign_key "STEM_GameGenre", "STEM_Game", column: "game_id", name: "FK__STEM_Game__game___2DB29345"
  add_foreign_key "STEM_GameGenre", "STEM_Genre", column: "genre_id", name: "FK__STEM_Game__genre__2CBE6F0C"
  add_foreign_key "STEM_Pic", "STEM_Game", column: "game_id", name: "FK__STEM_Pic__game_i__383021B8"
  add_foreign_key "STEM_UserGame", "STEM_Game", column: "game_id", name: "FK__STEM_User__game___270595B6"
  add_foreign_key "STEM_UserGame", "STEM_User", column: "user_id", name: "FK__STEM_User__user___2611717D"
  add_foreign_key "STEM_Vid", "STEM_Game", column: "game_id", name: "FK__STEM_Vid__game_i__3B0C8E63"
  add_foreign_key "Supply", "Managers", column: "managers_id", primary_key: "ID_Manager", name: "FK_Managers_Supply_ID_Supply"
  add_foreign_key "Supply", "Purveyors", column: "purveyors_id", primary_key: "ID_Purveyor", name: "FK_Purveyors_Supply_ID_Supply"
  add_foreign_key "_Image", "_Movie", column: "movie_id", name: "_Image_movie_id_b245ee65_fk__Movie_id"
  add_foreign_key "_Movie", "_AccessLevel", column: "access_lvl_id", name: "_Movie_access_lvl_id_ba8405fa_fk__AccessLevel_id"
  add_foreign_key "_MovieCard", "_Movie", column: "movie_id", name: "_MovieCard_movie_id_bb33e276_fk__Movie_id"
  add_foreign_key "_MovieCard", "_User", column: "user_id", name: "_MovieCard_user_id_fe2513f2_fk__User_id"
  add_foreign_key "_MovieGenre", "_Genre", column: "genre_id", name: "_MovieGenre_genre_id_8e3f85bd_fk__Genre_id"
  add_foreign_key "_MovieGenre", "_Movie", column: "movie_id", name: "_MovieGenre_movie_id_8dec3a33_fk__Movie_id"
  add_foreign_key "_MovieMember", "_Member", column: "member_id", name: "_MovieMember_member_id_68cbcb05_fk__Member_id"
  add_foreign_key "_MovieMember", "_Movie", column: "movie_id", name: "_MovieMember_movie_id_2bad8f7f_fk__Movie_id"
  add_foreign_key "_PromoCode", "_Subscription", column: "subscription_id", name: "_PromoCode_subscription_id_8b76af06_fk__Subscription_id"
  add_foreign_key "_Subscription", "_AccessLevel", column: "access_level_id", name: "_Subscription_access_level_id_8447cc4f_fk__AccessLevel_id"
  add_foreign_key "_User", "_Subscription", column: "subscription_id", name: "_User_subscription_id_36f05012_fk__Subscription_id"
  add_foreign_key "_UserPromoCode", "_PromoCode", column: "promo_code_id", name: "_UserPromoCode_promo_code_id_db37b6e2_fk__PromoCode_id"
  add_foreign_key "_UserPromoCode", "_User", column: "user_id", name: "_UserPromoCode_user_id_18d7fc0a_fk__User_id"
  add_foreign_key "_User_groups", "_User", column: "user_id", name: "_User_groups_user_id_efa5f5c3_fk__User_id"
  add_foreign_key "_User_groups", "auth_group", column: "group_id", name: "_User_groups_group_id_0f6161de_fk_auth_group_id"
  add_foreign_key "_User_user_permissions", "_User", column: "user_id", name: "_User_user_permissions_user_id_65ec8460_fk__User_id"
  add_foreign_key "_User_user_permissions", "auth_permission", column: "permission_id", name: "_User_user_permissions_permission_id_b1ef9d5e_fk_auth_permission_id"
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_content_type_id"
  add_foreign_key "django_admin_log", "_User", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk__User_id"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id"
  add_foreign_key "msu_images", "msu_lectures", on_delete: :cascade
  add_foreign_key "msu_lecture_books", "msu_books", column: "msu_books_id", on_delete: :cascade
  add_foreign_key "msu_lecture_books", "msu_lectures", column: "msu_lectures_id", on_delete: :cascade
  add_foreign_key "msu_lectures", "msu_disciplines", on_delete: :cascade
  add_foreign_key "msu_presentations", "msu_lectures"
end
