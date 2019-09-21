#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

require 'xcodeproj'

def sort_proj_file(project_path)
    p "开始排序>>>"
    project = Xcodeproj::Project.open(project_path)
    group_map = Hash.new(1)
    project.files.each { |item|
        group_map[item.parent] = "1"
    }
    group_map.each do |group, value|
        group.sort
        print group.display_name," 排序完成>>>","\n"
    end
    print "\n\n"
    p "-----------------"
    p "操作完成, 准备保存工程>>>"
    p "-----------------"
    project.save
    print "\n"
    p "-----------------"
    p "保存完成!"
    p "-----------------"
end

sort_proj_file(ARGV.first)
