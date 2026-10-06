package view.game.pet
{
   import CommonUI.Button.Button2;
   import CommonUI.Button.SimpleLinkLabel;
   import CommonUI.Label.Label;
   import CommonUI.Panel.Panel0;
   import CommonUI.Progress.ProgressBarYellow;
   import CommonUI.ToolTip.CommonUseTip;
   import CommonUI.Window.CloseWindow3;
   import Logic.Actors.Structures.PropertySet;
   import common.Data.Characters.type.ActorProperties;
   import common.Data.hero.user.WarriorInfo;
   import common.GameResource;
   import common.GlobalData;
   import control.controler.HeroCC;
   import events.DataEventDispatcher;
   import events.HeroEvent;
   import events.PropertyEvent;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import ui.image.Image;
   import ui.richfield.GameRichFiled;
   import utils.FilterUtils;
   import view.game.components.effect.MDPMovieMgr;
   import view.game.shenlu.subPage.ShenluQuickBuyPanel;

   public class WarriorLTWin extends CloseWindow3
   {

      public static const WIDTH:int = 386;

      public static const HEIGHT:int = 510;

      private var _bar:ProgressBarYellow;

      private var _curAttriFiled:GameRichFiled;

      private var _nextAttriFiled:GameRichFiled;

      private var _upBtn:Button2;

      private var _warriorLev:Label;

      private var _quickBuyLink:SimpleLinkLabel;

      private var _quickBuyPanel:ShenluQuickBuyPanel;

      private var _tipLab:Label;

      private var _fullLvImg:Image;

      public function WarriorLTWin()
      {
         super();
         this.createUI();
      }

      protected function createUI() : void
      {
         var _loc1_:Bitmap = null;
         title = "战将练体";
         setSize(WIDTH,HEIGHT);
         _loc1_ = GameResource.defaultResource.getOtherPng(985);
         _loc1_.x = 7;
         _loc1_.y = 40;
         addChild(_loc1_);
         var _loc2_:Image = new Image();
         _loc2_.content = GameResource.defaultResource.getOtherPng(986);
         _loc2_.move(129,41);
         addChild(_loc2_);
         this._bar = new ProgressBarYellow();
         this._bar.move(23,415);
         this._bar.showText = true;
         addChild(this._bar);
         var _loc3_:Panel0 = new Panel0();
         _loc3_.setSize(180,90);
         _loc3_.move(100,92);
         addChild(_loc3_);
         _loc3_ = new Panel0();
         _loc3_.setSize(180,90);
         _loc3_.move(100,250);
         addChild(_loc3_);
         this._curAttriFiled = new GameRichFiled();
         this._curAttriFiled.setSize(200,136);
         this._curAttriFiled.move(133,118);
         this._curAttriFiled.lineSpace = 8;
         this._curAttriFiled.textFilters = FilterUtils.DefaultTextFilters;
         addChild(this._curAttriFiled);
         this._nextAttriFiled = new GameRichFiled();
         this._nextAttriFiled.setSize(200,136);
         this._nextAttriFiled.move(133,276);
         this._nextAttriFiled.lineSpace = 8;
         this._nextAttriFiled.textFilters = FilterUtils.DefaultTextFilters;
         addChild(this._nextAttriFiled);
         this._upBtn = new Button2();
         this._upBtn.caption = "升  级";
         this._upBtn.colors = [13812091,13812091,13812091,13812091,13812091];
         this._upBtn.move(156,454);
         addChild(this._upBtn);
         this._warriorLev = new Label();
         this._warriorLev.caption = "<font color=\'#d9a045\'>战将练体: LV" + 10 + "</font>";
         this._warriorLev.move(138,57);
         addChild(this._warriorLev);
         var _loc4_:CommonUseTip = new CommonUseTip("说明","<font color=\'#00FF00\'>战将练体说明:</font><BR>1.战将练体可使用战将灵力提升练体的等级<BR>2.战将灵力来源：商铺购买");
         _loc4_.move(50,470);
         addChild(_loc4_);
         this._quickBuyLink = new SimpleLinkLabel("快捷购买");
         this._quickBuyLink.move(310,470);
         addChild(this._quickBuyLink);
         this._quickBuyPanel = new ShenluQuickBuyPanel([551,552,553]);
         this._quickBuyPanel.visible = false;
         this._quickBuyPanel.move(386,0);
         addChild(this._quickBuyPanel);
         this._tipLab = new Label();
         this._tipLab.caption = "升至下一阶需要消耗战将灵力";
         this._tipLab.move(107,395);
         addChild(this._tipLab);
         _loc2_ = new Image();
         _loc2_.content = GameResource.defaultResource.getOtherPng(987);
         _loc2_.move(163,182);
         addChild(_loc2_);
         var _loc5_:Image = new Image();
         _loc5_.content = GameResource.defaultResource.getOtherPng(946);
         _loc5_.move(5,384);
         _loc5_.setSize(376,11);
         _loc5_.scaleEnable = true;
         addChild(_loc5_);
         var _loc6_:Image = new Image();
         _loc6_.content = GameResource.defaultResource.getOtherPng(946);
         _loc6_.move(106,97);
         _loc6_.setSize(168,9);
         _loc6_.scaleEnable = true;
         this.addChild(_loc6_);
         _loc6_ = new Image();
         _loc6_.content = GameResource.defaultResource.getOtherPng(946);
         _loc6_.setSize(168,9);
         _loc6_.move(106,255);
         _loc6_.scaleEnable = true;
         this.addChild(_loc6_);
         this._fullLvImg = new Image();
         this._fullLvImg.content = GameResource.defaultResource.getOtherPng(1826);
         this._fullLvImg.move(138,278);
         this._fullLvImg.visible = false;
         this.addChild(this._fullLvImg);
      }

      override protected function onAddedToStage(param1:Event) : void
      {
         super.onAddedToStage(param1);
         this._upBtn.addEventListener(MouseEvent.CLICK,this.onClickUp);
         this._quickBuyLink.addEventListener(MouseEvent.CLICK,this.onClickQuick);
         DataEventDispatcher.addEventListener(PropertyEvent.MAIN_NUMBER_CHANGE,this.onUpdate);
         DataEventDispatcher.addEventListener(HeroEvent.Hero_LT_Result,this.onLtResult);
      }

      private function isMaxlv() : void
      {
      }

      private function onLtResult(param1:HeroEvent) : void
      {
         var _loc2_:int = param1.data as int;
         if(_loc2_)
         {
            MDPMovieMgr.playMDPMovieAt(237,new Point(204,205),this,1);
         }
      }

      override protected function onRemovedFromStage(param1:Event) : void
      {
         super.onRemovedFromStage(param1);
         this._upBtn.removeEventListener(MouseEvent.CLICK,this.onClickUp);
         this._quickBuyLink.removeEventListener(MouseEvent.CLICK,this.onClickQuick);
         DataEventDispatcher.removeEventListener(PropertyEvent.MAIN_NUMBER_CHANGE,this.onUpdate);
         DataEventDispatcher.removeEventListener(HeroEvent.Hero_LT_Result,this.onLtResult);
      }

      protected function onUpdate(param1:PropertyEvent) : void
      {
         var _loc3_:WarriorInfo = null;
         var _loc2_:PropertySet = param1.propertySet as PropertySet;
         if(_loc2_.hasOwnProperty(ActorProperties.AP_ACTOR_PET_SPIRIT))
         {
            _loc3_ = GlobalData.heroDataMgr.warriorInfo;
            if(GlobalData.role.petSpirit > int.MAX_VALUE)
            {
               this._bar.setProgressDirectly(0,_loc3_ ? _loc3_.maxExp : 0);
            }
            else
            {
               this._bar.setProgressDirectly(GlobalData.role.petSpirit,_loc3_ ? _loc3_.maxExp : 0);
            }
         }
      }

      override public function close() : void
      {
         this.visible = false;
      }

      protected function onClickQuick(param1:MouseEvent) : void
      {
         this._quickBuyPanel.visible = !this._quickBuyPanel.visible;
      }

      private function formatLtAttrs(param1:int, param2:String) : String
      {
         var _loc3_:int = int(Math.min(Math.max(param1 - 200,0),50));
         if(_loc3_ <= 0)
         {
            return param2;
         }
         return param2 + "<font color='#c354c0'><BR>生命加成: +" + _loc3_ * 100000 + "<BR>物防加成: +" + _loc3_ * 500 + "-" + _loc3_ * 500 + "<BR>魔防加成: +" + _loc3_ * 500 + "-" + _loc3_ * 500 + "</font>";
      }

      public function refreshData() : void
      {
         var _loc1_:WarriorInfo = GlobalData.heroDataMgr.warriorInfo;
         if(!_loc1_)
         {
            return;
         }
         this._warriorLev.caption = "<font color=\'#d9a045\'>战将练体: LV" + _loc1_.ltLev + "</font>";
         this._bar.setProgress(GlobalData.role.petSpirit,_loc1_.maxExp);
         var _loc2_:Boolean = _loc1_.ltLev > 200;
         this._curAttriFiled.move(_loc2_ ? 111 : 133,_loc2_ ? 100 : 118);
         this._curAttriFiled.setSize(_loc2_ ? 168 : 200,_loc2_ ? 82 : 136);
         this._curAttriFiled.lineSpace = _loc2_ ? 0 : 8;
         this._curAttriFiled.richText = this.formatLtAttrs(_loc1_.ltLev,GlobalData.heroDataMgr.mCurrentPet.warriorLTAttriDesc);
         if(_loc1_.ltLev >= _loc1_.maxLtLv)
         {
            this._fullLvImg.visible = true;
            this._upBtn.enabled = false;
            this._tipLab.caption = "已满级";
            this._tipLab.x = (WIDTH - this._tipLab.width - 10) / 2;
            this._nextAttriFiled.visible = false;
         }
         else
         {
            this._fullLvImg.visible = false;
            this._upBtn.enabled = true;
            this._tipLab.caption = "升至下一阶需要消耗战将灵力";
            var _loc3_:Boolean = _loc1_.ltLev >= 200;
            this._nextAttriFiled.move(_loc3_ ? 111 : 133,_loc3_ ? 258 : 276);
            this._nextAttriFiled.setSize(_loc3_ ? 168 : 200,_loc3_ ? 82 : 136);
            this._nextAttriFiled.lineSpace = _loc3_ ? 0 : 8;
            this._nextAttriFiled.richText = this.formatLtAttrs(_loc1_.ltLev + 1,GlobalData.heroDataMgr.mNextPet.warriorLTAttriDesc);
            this._nextAttriFiled.visible = true;
         }
      }

      protected function onClickUp(param1:MouseEvent) : void
      {
         HeroCC.sendQueryLT();
      }
   }
}
