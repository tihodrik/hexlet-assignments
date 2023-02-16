# frozen_string_literal: true

# BEGIN
def compare_versions(ver1, ver2)
  Gem::Version.new(ver1) <=> Gem::Version.new(ver2)
  #
  # Version 1
  #
  # v1_major, v1_minor = ver1.split('.').map(&:to_i)
  # v2_major, v2_minor = ver2.split('.').map(&:to_i)
  # if v1_major > v2_major || (v1_major == v2_major && v1_minor > v2_minor)
  #   1
  # elsif v1_major < v2_major || (v1_major == v2_major && v1_minor < v2_minor)
  #   -1
  # else
  #   0
  # end
  #
  # Version 2
  #
  # v1_major, v1_minor = ver1.split('.').map(&:to_i)
  # v2_major, v2_minor = ver2.split('.').map(&:to_i)
  #
  # if v1_major > v2_major
  #   1
  # elsif v1_major < v2_major
  #   -1
  # elsif v1_minor > v2_minor
  #   1
  # elsif v1_minor < v2_minor
  #   -1
  # else
  #   0
  # end
  #
  # Version 3
  #
  # v1 = ver1.split('.')
  # v2 = ver2.split('.')
  #
  # m = [v1[1].length, v2[1].length].max
  #
  # r1 = v1[0]
  # (m - v1[1].length).times { r1 += '0' } if v1[1].length < m
  # r1 += v1[1]
  #
  # r2 = v2[0]
  # (m - v2[1].length).times { r2 += '0' } if v2[1].length < m
  # r2 += v2[1]
  #
  # r1.to_i <=> r2.to_i
end
# END
