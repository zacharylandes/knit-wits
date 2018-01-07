require_relative './seed_generator'

sg = SeedGenerator.new
sg.load_users
sg.load_orders
sg.load_order_items
