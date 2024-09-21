# 设置参数
N <- 21859  # 总基因数
k1 <- 863  # DEU 中受选择的基因数
k2 <- 1311  # DIR 中受选择的基因数
observed_overlap <- 414  # 观察到的重叠基因数
n_permutations <- 10000  # 置换次数

# 生成总基因集合
all_genes <- 1:N

# 初始化重叠数数组
random_overlaps <- numeric(n_permutations)

# 进行置换检验
set.seed(1)  # 固定随机数种子以便重现
for (i in 1:n_permutations) {
  # 随机选择 group1 和 group2 的基因
  group1_random <- sample(all_genes, k1, replace = FALSE)
  group2_random <- sample(all_genes, k2, replace = FALSE)
  
  # 计算随机情况下的重叠基因数
  random_overlaps[i] <- length(intersect(group1_random, group2_random))
}

# 计算 P 值：置换过程中重叠数大于或等于观察到的重叠数的比例
p_value <- mean(random_overlaps >= observed_overlap)

# 输出结果
p_value

# 绘制置换生成的重叠分布直方图
hist(random_overlaps, breaks = 50, main = "Distribution of Overlaps from Permutation Test (DEU-DIR)",
     xlab = "Number of Overlaps", col = "#3f93ee", border = "white")
abline(v = observed_overlap, col = "red", lwd = 2)  # 标记实际重叠数
