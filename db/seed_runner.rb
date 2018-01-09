require_relative './seed_generator'

sg = SeedGenerator.new(ARGV[0], ARGV[1], ARGV[2])
sg.load_users
sg.load_orders
sg.load_order_items
sg.load_retired_items
