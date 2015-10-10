#冒烟儿了吗，您？

- time: 2007-02-11 17:48
- tags: 测试
 
---
<p align="center"><strong>&nbsp;</strong></p>
<p><strong><span>关于此文</span></strong></p>
<p><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span>看了题目，如果你以为这是一篇关于吸烟的文章的话，我想你有必要一读。这篇文章基于我们初步实施每日构造、每日冒烟测试的方案资料所写的。由于初步实施所以讨论的内容比较粗浅，欢迎经验比较丰富的兄弟（尤其是测试人员噢</span><span>~</span><span>）提出宝贵意见。其内容多来自于互联网和近期的项目实践。</span>&nbsp;</p>
<p><strong><span>缘起</span></strong></p>
<p><strong><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong><span>我们这个项目算是公司成立以来最大的一个平台级项目，从公司领导到各级职能部门都对项目给与了相当的重视和支持。当然，与此同时也提出了更高的要求。虽然，这是一个政府项目，但在立项之初我们就决定将此项目做成一个公司发展史上一个里程碑式的作品。因此，我们在开发过程中尽我们所能的遵循了现在业界比较成熟的设计、开发及管理技术。其中，借鉴了包括</span><span>Unified Process,TDD,OOD</span><span>以及敏捷开发等的一些规范，并转化成我们的流程、规范、制度乃至代码。一边学习一边动手，谢天谢地，我们现在已经把领导的一个个简单的想法变成了一行行的代码、一份份的规范和报告，完工之日近矣。</span></p>
<p><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span>但是，在开发阶段我们遇到了一个很大的问题，测试和开发流程严重脱节；另外，每次各级领导要来跟踪项目时，我们只能给他提供一些关于开发进度的文档，和很久以前（大约一两周以前）的</span><span>build</span><span>版本，不难看出领导十分希望看到当前的工作成果。前一段时间，客户说来看看我们的项目进度，导致我们一连加了两天班</span><span>build</span><span>出了一个版本，并赶鸭子似的寻找</span><span>bug</span><span>（为此我们牺牲了我们的周末，为了不增加项目成本，我们也没有申请加班，晕死</span><span>~~~</span><span>）</span></p>
<p><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span>因此，经过测试人员的建议和组员的讨论后，我们决定采用“每日构造”。</span></p>
<p>&nbsp;</p>
<p><strong><span>还是“为什么”？</span></strong></p>
<p><strong><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong><span>之所采用每日构造，如果说成是为了应付领导和客户的检查，那未免太可笑了。但那确实是重要原因之一。</span></p>
<p><strong><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong><span>如果你查过相关的资料的话，你可能了解到这样一句话：<strong>每日构造就像是项目的心跳</strong>。你应该也了解，每日</span><span>build</span><span>和冒烟测试几乎是分不开的。的确是这样，由于本人言辞卓略，下面将大篇幅的引用</span><span>51Testing</span><span>中相关的资料。</span><span>来说明其非常重要的意义：</span></p>
<p><span>1</span><span>、能最小化集成风险<span> </span></span></p>
<p><span>项目组可能遇到的一个很大的风险是，项目组成员根据不同的系统功能各自开发不同的代码，但是当这些代码集成为一个系统的时候，也许系统完成不了预期的功能。这种风险的发生取决于项目中的这种不兼容性多久才被发现，由于程序界面已经发生了变化，或者系统的主要部分已经被重新设计和重新实现了，相应的排错工作将非常困难和耗时。极端情况下，集成的错误可能回导致项目被取消掉。每日构造和冒烟测试可以使这种集成错误变得非常小，而且便于解决，防止了很多集成问题的产生。</span></p>
<p><span>2</span><span>、能减小产品低质量的风险<span> </span></span></p>
<p><span>这种风险是和集成不成功、集成出错相关联的。每天对集成的代码做一些少量的冒烟测试，即可杜绝项目中那些基本的质量问题。通过这种方式，使系统达到一种周知的良好状态，维护这样的系统可以防止系统逐步恶化到耗费大量时间排查质量问题的地步。</span></p>
<p><span>3</span><span>、能简单化错误诊断</span></p>
<p><span>当系统每天都进行<span>build</span>和测试时，系统任何一天发生的错误都能够变得十分精细，便于排查。比如在<span>17</span>日系统还运行正常，<span>18</span>日就出错了，那么只需要检查这两次<span>build</span>之间的代码变化就可以了。</span></p>
<p><span>4</span><span>、能极大鼓舞项目组的士气<span> </span></span></p>
<p><span>看到产品的不断成长，能够极大的鼓舞项目组的士气，有时甚至不管这个产品到底用来做什么。开发人员可能会为系统显示了一个矩形而感到激动。通过每日构造，产品每天进步一点点，保证项目士气的持续高涨。</span></p>
<p><span>好处这么多，真正执行起来也不一定一帆风顺</span><span> </span><span>：（</span></p>
<p>&nbsp;</p>
<p><strong><span>出问题了？</span></strong></p>
<p><strong><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong><span>在实施这项制度之初，我们遇到了一些问题，主要问题来自于开发人员的抱怨</span><span>—</span><span>他们质疑心跳的速度，人们都觉得心跳过速也是不好的。因此，大家对于这项制度表现出了应有的反感：）</span></p>
<p><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span>如果你跟他们解释什么“最小化集成风险”，“降低质量风险”，“</span><span>简单化错误诊断</span><span>”种种的话，我想那时比较扯淡的。呵呵，我想还是得在制度层面来考虑问题。</span></p>
<p><strong><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong><span>由于实际情况，我们没有完全的敏捷也没有完全的</span><span>xp,</span><span>在详细设计完成后我们确定了三个版本的螺旋式的开发过程，以保证从设计到开发再到测试所有文档及成果的完整性，以及应对需求变化的能力。开发上单元测试和源代码一样纳入了项目考核体系，每个版本更替过程中强调重构和模式。</span></p>
<p><span>鉴于之前的一些问题，每日构造的构造者由项目经理在每个工作日开始时取新</span><span>build,</span><span>然后这一天中测试人员随机安排测试时间来维护测试工程，实现冒烟测试。如果出现问题，直接通过</span><span>bugfree</span><span>来提交给项目经理又项目经理仲裁</span><span>bug</span><span>的性质，进行</span><span>bug</span><span>分配。月底，经过确认的</span><span>bug</span><span>都会换算成绩效。制度动态的建立了，实施了一段时间后，同志们也就习以为常了。</span></p>
<p><span>这样似乎，每日构造就像每天都要提交的工作日志一样，变得非常轻松。但是问题还是有的。比如，由于此项工作是由测试人员提出的，他的工作积极性挺高，但假如有一天他没有这个激情了，怎么办？我想，下一步就应该给测试人员上把锁了，嘿嘿</span><span>~~~~</span></p>
<p><span>另外，作为一项制度，在下一个项目的开发中我们将会把它放到项目成本中考虑，这活儿总不能总让项目经理干吧：）</span><span>~~~</span></p>
<p><span>其实，在这里我说得比较简单，制度的定制需要公司的具体情况，和执行者的持续摸索，所以说详细了也没用，嘿嘿</span><span>~~</span></p>
<p><strong><span>提升到自动化测试：</span></strong></p>
<p><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span>每日的冒烟测试，几乎全部都是测试人员早已制订好的功能测试。因此，他的一些测试脚本给他节约相当大的时间。就像单元测试一样，测试用例和测试脚本在不断的积累和维护后，使我们的测试工作变得相当的轻松。因此，我们在项目经验总结报告中预留了关于冒烟测试到自动化测试过程这么一节。</span></p>
<p>&nbsp;</p>
<p><strong><span>实施到底！</span></strong></p>
<p><strong><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong><span>每日构造和其他制度一样，都需要来自决策者和权利者的约束和鼓励。如果，你仅仅是一个开发人员或测试人员，你想实行某项对项目有利的制度的话，我想你一定会找一个可以谈得来又有相当执行力的领导来做这项工作，否则这项工作几乎是不可能的。</span></p>
<p><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span>但是，这也不是绝对的。如果，你是一个有责任感的参与者，我想你会想尽办法打个漂亮仗，因为项目是公司的也是你的！真是这样的话，恭喜你</span><span>----不远的将来你会为你的坚持和坚持后所取得的成绩而骄傲的</span><span>！</span></p>
<p><strong><span>相关资料</span></strong></p>
<p><strong><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong><strong><span><a href="http://www.51测试.com/html/36/674.html"><span><span>每日构造与冒烟测试</span></span></a></span></strong></p>
<p><strong><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong><span><a href="http://blog.csdn.net/wingfiring/archive/2006/01/16/580696.aspx"><span><span>从每日构造到持续继承</span></span></a></span></p>
<p><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><a href="http://www.dots.com.cn/DisplayNews.aspx?_id=148"><span><span>每日构造流程</span></span></a></span></p>
<p><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><a href="http://www.uml.org.cn/test/200701184.asp"><span><span>从单元测试到基于每日构造的自动测试</span></span></a></span></p>

