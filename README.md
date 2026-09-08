# Style Compass · 风格罗盘

把「个人审美」蒸馏成 **介质无关的视觉规范**，让 AI 的视觉产出——无论是网页、应用 UI、PPT 还是平面设计——都能呈现出高级、非模板化、有个人品味的质感。

> 与主流「反 slop」类前端技能不同，Style Compass 的立场是：
> **规范与介质解耦**。风格库里存的不是 Tailwind 类名、不是某一种画布尺寸，而是可跨介质翻译的「视觉原语」——色彩比例、对比节奏、留白占比、栅格性格、字体气质、材质语气。落地成什么介质，由「介质映射」翻译成该介质的具体参数。

## 它解决什么问题

AI Agent 生成的视觉内容（网页 / UI / PPT / 海报）普遍存在同质化问题：模板化的卡片布局、无意义的渐变与光晕、塞满的版面、占位内容。缺的不是"更好看的默认值"，而是**一套能把人的审美判断编码给 Agent 的方法**——这正是 Style Compass 提供的。

## 安装

```bash
# 通过 agent-skills CLI 安装（扫描本仓库 skills/ 目录）
npx skills add https://github.com/et766675769-source/style-compass

# 或指定安装单一技能
npx skills add https://github.com/et766675769-source/style-compass --skill "style-compass"
```

也可以直接把 `skills/style-compass/SKILL.md` 及其 `references/` 复制进项目或对话中使用。

## 快速上手

1. **直接使用**：让 Agent 按本技能设计一个界面/PPT/海报，先体验内置演示风格（编辑杂志·留白克制）。
2. **蒸馏你自己的审美（推荐）**：把收藏的好设计喂给 Agent（截图或链接），按「蒸馏模式」生成属于你的 `style-*.md` 风格库——这是本项目的核心用法，也是让它真正"像你"的唯一方式。
3. **反模式自查**：任何产出后按 `ai-tells.md` 逐条核对，消除"AI 味"。

## 仓库结构

```
├── README.md
├── LICENSE                     # MIT
├── research/                   # 提炼方法论与设计依据（开源后可读）
├── examples/                   # before/after 等演示素材
└── skills/
    └── style-compass/          # 主技能（可被 npx skills add 发现）
        ├── SKILL.md            # 双模式工作流：蒸馏模式 + 应用模式
        ├── agents/openai.yaml  # UI 元数据
        ├── assets/             # 参考图、字体授权清单、对比图等
        └── references/
            ├── style-template.md                 # 风格文件母版
            ├── style-editorial-calm.md           # 正式风格：编辑式留白 · 冷调克制
            ├── style-clean-minimal.md            # 正式风格：素雅极简 · 干净呼吸
            ├── style-dark-glass.md               # 正式风格：暗夜玻璃 · 沉浸科技
            ├── style-dark-glow.md                # 正式风格：暗调辉光 · 戏剧沉浸
            ├── style-bold-playful.md             # 正式风格：高饱和撞色 · 怪诞大字
            ├── style-example-editorial-calm.md   # 演示风格（成品示例，可删可留作默认）
            ├── case-card-template.md            # 案例标注卡模板
            ├── medium-mapping.md                # 介质映射：网页/UI/PPT/平面
            └── ai-tells.md                      # AI 味反模式清单
```

## 核心概念

| 概念 | 说明 |
| --- | --- |
| **视觉原语** | 介质无关的规范表述：色彩比例、层级对比、留白占比、栅格性格、字体气质、材质语气 |
| **风格文件** `style-*.md` | 一个「视觉气质」的完整规范（用母版生成），内含各介质映射表 |
| **介质映射** `medium-mapping.md` | 把视觉原语翻译成网页/CSS、应用 UI、PPT、平面等介质的具体参数与质量坑 |
| **案例卡** | 单案例的结构化标注，区分"可迁移要素"与"介质特有要素"，是蒸馏的原料 |
| **AI 味清单** | 跨介质与各介质专属的 AI 同质化特征 + 替代做法 |

## 参与贡献

欢迎以这些方式参与 AI 开源事业：

- **贡献你的风格**：按 `style-template.md` 蒸馏一套风格，PR 到 `references/`（注意：只放你有权使用的案例）。
- **贡献反模式**：发现新的"一眼 AI"特征，补进 `ai-tells.md` 并注明来源案例。
- **改进介质映射**：补充新介质（邮件、长文档、大屏、社媒图卡…）或修正现有翻译规则。
- **方法论讨论**：见 `research/`。

## 许可

[MIT License](LICENSE)。技能内容与模板自由使用；`assets/` 与案例相关素材请遵守各自来源的授权。
