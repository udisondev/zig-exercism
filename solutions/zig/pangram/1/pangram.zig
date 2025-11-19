const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();
    var map = std.AutoHashMap(u8, u8).init(allocator);
    defer map.deinit();

    for (str) |char| {
        if (!std.ascii.isAlphabetic(char)) {
            continue;
        }
        const lower = std.ascii.toLower(char);
        map.put(lower, 1) catch unreachable;
    }

    return map.count() == 26;
}
