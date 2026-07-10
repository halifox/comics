# `/api/v3/h5/homeIndex` 字段说明

分析样本：`2026-07-09T06_52_06.686861Z_GET__api_v3_h5_homeIndex.json`

本文根据返回值、字段命名和字段之间的关系推断。接口未提供正式文档的字段会标记为“推测”。

## 顶层响应

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `code` | `int` | 业务状态码。样本中 `200` 表示请求成功。 |
| `message` | `string` | 业务状态说明。 |
| `results` | `object` | 首页的实际数据。 |

## `results` 首页分区

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `topics` | `TopicSection` | 漫画推荐专题，样本总数为 39。 |
| `topicsList` | `TopicSection` | 范围更广的专题列表，包含漫画专题及写真等其他专题，样本总数为 63。 |
| `recComics` | `RecommendSection` | 首页推荐漫画。 |
| `hotComics` | `UpdateItem[]` | 热门更新漫画。这里的“热门”仍以更新条目形式返回。 |
| `newComics` | `UpdateItem[]` | 最新更新漫画。 |
| `finishComics` | `ComicSection` | 已完结漫画分区。 |
| `rankDayComics` | `RankSection` | 日榜。 |
| `rankWeekComics` | `RankSection` | 周榜。 |
| `rankMonthComics` | `RankSection` | 月榜。 |
| `banners` | `Banner[]` | 首页轮播图或推广入口。 |

## 通用分页字段

`topics`、`topicsList`、`recComics`、`finishComics` 和榜单对象都使用了部分或全部分页字段。

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `list` | `array` | 当前页的数据列表。 |
| `total` | `int` | 此分区可用数据总数，不是当前列表长度。 |
| `limit` | `int` | 本次最多返回的条数。 |
| `offset` | `int` | 分页起始偏移量；`0` 表示从第一条开始。 |

## 专题 `Topic`

结构位置：`topics.list[]`、`topicsList.list[]`。

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `title` | `string` | 专题完整标题。 |
| `series` | `null/string?` | 专题所属系列；当前样本全部为 `null`，具体格式尚无法确认。 |
| `journal` | `string` | 专题所属年份或刊期年份，例如 `"2026"`。 |
| `cover` | `string` | 专题横幅封面 URL。 |
| `period` | `string` | 人类可读的期号，例如 `"第39期"`。 |
| `type` | `int` | 专题类别代码。由样本推测 `1` 为漫画推荐，`4` 为写真专题；其他值需更多样本确认。 |
| `brief` | `string` | 专题简介，可能为空字符串。 |
| `path_word` | `string` | 专题 URL slug/业务路径标识，用于请求详情或构造路由。 |
| `datetime_created` | `string` | 专题创建或发布日期，格式为 `yyyy-MM-dd`。 |

`topics` 与 `topicsList` 的数据会部分重复，但两者 `total` 不同。因此不应简单视为同一个字段的别名；前者更像漫画专题，后者像全类型专题。

## 漫画 `Comic`

漫画对象会出现在推荐、更新、完结和榜单中。不同分区返回的字段子集略有差异。

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `name` | `string` | 漫画名称。 |
| `path_word` | `string` | 漫画的稳定业务标识/URL slug，是打开漫画详情时的重要参数。 |
| `cover` | `string` | 漫画封面图片 URL。URL 尾部通常包含缩略图尺寸。 |
| `author` | `NamedPath[]` | 作者列表。 |
| `author_alias` | `string` | 作者名的扁平展示文本；多名作者用逗号连接。适合直接展示，不适合作为稳定 ID。 |
| `popular` | `int` | 漫画累计热度或人气值。它不同于榜单条目外层的同期统计值。 |
| `datetime_updated` | `string` | 漫画最近更新日期，格式为 `yyyy-MM-dd`。只在部分分区出现。 |
| `last_chapter_name` | `string` | 最新章节的显示名称，例如 `"第169話"`。 |
| `females` | `NamedPath[]` | 女性向分类或女性读者标签（推测）；本样本均为空，无法进一步确认。 |
| `males` | `NamedPath[]` | 男性向分类或男性读者标签（推测）；本样本均为空。 |
| `theme` | `NamedPath[]` | 题材/主题标签列表；本样本均为空。 |
| `free_type` | `null/int?` | 免费阅读策略或免费类型代码（推测）。只在完结分区出现且样本均为 `null`。 |

### 作者或标签 `NamedPath`

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `name` | `string` | 显示名称。 |
| `path_word` | `string` | 作者或标签的业务路径标识。完结分区的作者 `path_word` 在样本中为空字符串，使用时需允许为空。 |

## 推荐漫画

结构位置：`recComics.list[]`。

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `type` | `int` | 推荐项类型。样本全部为 `1`，推测表示普通漫画推荐。 |
| `comic` | `Comic` | 被推荐的漫画。 |

注意：推荐列表元素不是直接的 `Comic`，而是 `{ type, comic }` 包装对象。

## 热门和最新更新条目 `UpdateItem`

结构位置：`hotComics[]`、`newComics[]`。

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `name` | `string` | 本次更新章节名称。样本中与 `comic.last_chapter_name` 相同。 |
| `datetime_created` | `string` | 此更新条目的发布日期，格式为 `yyyy-MM-dd`。 |
| `comic` | `Comic` | 对应漫画信息。 |

这里的列表元素也不是直接的 `Comic`。外层描述“本次更新”，内层 `comic` 描述“漫画本身”。

## 完结分区 `finishComics`

除通用分页字段外还有：

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `name` | `string` | 分区显示名称，样本值为 `"已完结"`。 |
| `path_word` | `string` | 分区路由/筛选标识，样本值为 `"finish"`。 |
| `type` | `string` | 首页分区布局或位置类型。样本值为 `"top"`，确切枚举需更多样本确认。 |
| `list[]` | `Comic[]` | 完结漫画列表，元素直接是漫画对象，没有 `comic` 包装层。 |

## 排行榜 `RankItem`

结构位置：`rankDayComics.list[]`、`rankWeekComics.list[]`、`rankMonthComics.list[]`。

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `comic` | `Comic` | 上榜漫画。 |
| `sort` | `int` | 当前榜单名次，从 `1` 开始。 |
| `sort_last` | `int` | 上一个统计周期的名次。 |
| `rise_sort` | `int` | 相对上期的名次变化量。样本关系为 `sort_last - sort`：正数表示上升，负数表示下降，`0` 表示不变。 |
| `rise_num` | `int` | 本统计周期增加的热度/人气量（推测）。 |
| `popular` | `int` | 此榜单统计口径下的人气基数或统计值；不等同于 `comic.popular`。 |
| `date_type` | `int` | 榜单周期代码。样本可确定：`1` 日榜、`2` 周榜、`3` 月榜。 |

排行榜对象本身还包含 `list`、`total`、`limit`、`offset`。

## 轮播图 `Banner`

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `cover` | `string` | 轮播图图片 URL。 |
| `brief` | `string` | 轮播图标题、简介或宣传文案。 |
| `type` | `int` | 点击目标类型代码。样本出现 `1`、`3`、`6`。结合目标值推测：`1` 指向漫画，`3` 可能是应用内页面，`6` 可能是外部链接。 |
| `out_uuid` | `string` | 点击目标标识。其格式随 `type` 变化，可以是外部 URL、应用内路径（如 `/download`）或 UUID。 |
| `comic` | `null/ComicSummary` | 关联漫画。推广项可能为 `null`；漫画轮播项包含 `name` 和 `path_word`。 |

### `Banner.comic`

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| `name` | `string` | 关联漫画名称。 |
| `path_word` | `string` | 关联漫画的业务路径标识。 |

客户端处理轮播点击时应以 `type` 分支，并把 `out_uuid` 当作不透明目标值，不能假设它始终是 UUID。

## 与当前 Dart DTO 的差异

当前 `HomeResultDto` 尚未覆盖 `topics`、`topicsList` 和 `banners`，并且部分列表的嵌套层级不匹配：

1. `recComics.list[]` 是 `{ type, comic }`，当前 `_sectionComics` 会把包装对象直接当作 `ComicDto`，因此漫画字段可能被解析成默认空值。
2. `hotComics[]` 和 `newComics[]` 是 `{ name, datetime_created, comic }`，不是 `ComicDto[]`。
3. `rankDayComics.list[]`、`rankWeekComics.list[]` 和 `rankMonthComics.list[]` 是排行榜条目，漫画位于条目的 `comic` 字段内；不应通过 `_sectionComics` 直接解析成漫画。
4. `finishComics.list[]` 才是直接的 `Comic[]`，当前 `_sectionComics` 适用于这一分区。
5. 当前 `ComicDto` 未声明 `popular`、`author_alias`、`last_chapter_name`、`females`、`males` 等首页会用到的字段。

建议分别建立 `TopicDto`、`BannerDto`、`RecommendedComicDto`、`ComicUpdateDto`、`RankedComicDto` 和分页分区 DTO，保留接口原始层级，再在 UI 或 Repository 层按需要提取其中的 `comic`。
