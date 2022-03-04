<template>
  <main class="el-main">
    <div style="width: 100%;">
<!--      搜索栏-->
      <div class="el-row" style="border-bottom: 2px solid rgb(95, 139, 198);">
        <div class="plicy-search-header">
          <form class="el-form">
            <div class="el-col el-col-8">
              <div class="el-form-item">
                <label class="el-form-item__label" style="width: 130px;">Policy Category</label>
                <div class="el-form-item__content" style="margin-left: 130px;">
                  <div class="el-select" style="width: 260px;">
                    <div class="el-select__tags" style="width: 100%; max-width: 228px;">
                      <input type="text" autocomplete="off" class="el-select__input" style="flex-grow: 1; width: 0.0877193%; max-width: 218px;">
                    </div>
                    <div class="el-input el-input--suffix"><!---->
                      <input tabindex="-1" type="text" readonly="readonly" autocomplete="off" placeholder="Select" class="el-input__inner" style="height: 32px;"><!---->
                      <span class="el-input__suffix">
                        <span class="el-input__suffix-inner">
                          <i class="el-select__caret el-input__icon el-icon-arrow-up"></i><!----><!----><!----><!----><!---->
                        </span><!---->
                      </span><!----><!---->
                    </div>
                    <div class="el-select-dropdown el-popper is-multiple" style="display: none; min-width: 260px;">
                      <div class="el-scrollbar" style="">
                        <div class="el-select-dropdown__wrap el-scrollbar__wrap" style="margin-bottom: -5px; margin-right: -5px;">
                          <ul class="el-scrollbar__view el-select-dropdown__list"><!---->
                            <li class="el-select-dropdown__item">
                              <span>WS</span>
                            </li>
                            <li class="el-select-dropdown__item">
                              <span>MKT</span>
                            </li>
                          </ul>
                        </div>
                        <div class="el-scrollbar__bar is-horizontal">
                          <div class="el-scrollbar__thumb" style="transform: translateX(0%);">

                          </div>
                        </div>
                        <div class="el-scrollbar__bar is-vertical">
                          <div class="el-scrollbar__thumb" style="transform: translateY(0%);">

                          </div>
                        </div>
                      </div><!---->
                    </div>
                  </div><!---->
                </div>
              </div>
            </div>
            <div class="el-col el-col-8">
              <div class="el-form-item">
                <label class="el-form-item__label" style="width: 130px;">
                  CL#</label>
                <div class="el-form-item__content" style="margin-left: 130px;">
                  <div class="el-input el-input--suffix" style="width: 260px;"><!---->
                    <input type="text" autocomplete="off" placeholder="Input CL# to search" class="el-input__inner"><!----><!----><!----><!---->
                  </div><!---->
                </div>
              </div>
            </div>
            <div class="el-col el-col-8">
              <div class="el-form-item">
                <label class="el-form-item__label" style="width: 130px;">Policy Name</label>
                <div class="el-form-item__content" style="margin-left: 130px;">
                  <div class="el-input el-input--suffix" style="width: 260px;"><!---->
                    <input type="text" autocomplete="off" placeholder="Input Policy Name to search" class="el-input__inner"><!----><!----><!----><!---->
                  </div><!---->
                </div>
              </div>
            </div>
            <div class="el-col el-col-8">
              <div class="el-form-item">
                <label class="el-form-item__label" style="width: 130px;">Valid Period</label>
                <div class="el-form-item__content" style="margin-left: 130px;">
                  <div data-v-0d50cef0="">
                    <div data-v-0d50cef0="" class="mask" style="display: none;"></div>
                    <span data-v-0d50cef0="">
                      <div role="tooltip" id="el-popover-6815" aria-hidden="true" class="el-popover el-popper" tabindex="0" style="width: 360px; display: none;"><!---->
                        <div data-v-0d50cef0="" class="el-button-group" style="margin-bottom: 2px;">
                          <button data-v-0d50cef0="" type="button" class="el-button el-button--primary el-button--small"><!----><!---->
                            <span>Date Range</span>
                          </button>
                          <button data-v-0d50cef0="" type="button" class="el-button el-button--primary el-button--small is-plain"><!----><!---->
                            <span>Month Range</span>
                          </button>
                          <button data-v-0d50cef0="" type="button" class="el-button el-button--primary el-button--small is-plain"><!----><!---->
                            <span>Year Range</span>
                          </button>
                        </div>
                        <div data-v-0d50cef0="" class="block">
                          <div data-v-0d50cef0="" class="date-pickers-wrapper">
                            <div data-v-0d50cef0="" class="el-date-editor el-input el-input--prefix el-input--suffix el-date-editor--date"><!---->
                              <input type="text" autocomplete="off" name="" placeholder="Start Time" class="el-input__inner">
                              <span class="el-input__prefix">
                                <i class="el-input__icon el-icon-date"></i><!---->
                              </span>
                              <span class="el-input__suffix">
                                <span class="el-input__suffix-inner">
                                  <i class="el-input__icon"></i><!----><!----><!----><!---->
                                </span><!---->
                              </span><!----><!---->
                            </div>
                            <div data-v-0d50cef0="" class="time-spilt">~</div>
                            <div data-v-0d50cef0="" class="el-date-editor el-input el-input--prefix el-input--suffix el-date-editor--date"><!---->
                              <input type="text" autocomplete="off" name="" placeholder="End Time" class="el-input__inner">
                              <span class="el-input__prefix">
                                <i class="el-input__icon el-icon-date">

                              </i><!---->
                              </span>
                              <span class="el-input__suffix">
                                <span class="el-input__suffix-inner">
                                  <i class="el-input__icon"></i><!----><!----><!----><!---->
                                </span><!---->
                              </span><!----><!---->
                            </div>
                          </div><!----><!---->
                        </div>
                      </div>
                      <span class="el-popover__reference-wrapper">
                        <div data-v-0d50cef0="" class="el-input el-input--suffix el-popover__reference" aria-describedby="el-popover-6815" tabindex="0" style="max-width: 226px;"><!---->
                          <input type="text" autocomplete="off" placeholder="Please select range" class="el-input__inner"><!---->
                          <span class="el-input__suffix">
                            <span class="el-input__suffix-inner">
                              <i class="el-input__icon el-icon-date">

                              </i><!----><!----><!---->
                            </span><!---->
                          </span><!----><!---->
                        </div>
                      </span>
                    </span>
                  </div><!---->
                </div>
              </div>
            </div> <!-- 时间范围 -->
          </form>
          <span class="plicy-search-operation">
            <button type="button" class="el-button el-button--default"><!---->
              <i class="el-icon-remove-outline"></i>
              <span>Clear</span></button>
            <button type="button" class="el-button el-button--primary"><!---->
              <i class="el-icon-search"></i>
              <span>Search</span>
            </button>
          </span>
        </div>
      </div>
<!--      主体-->
      <div class="table-header">
        <span class="plicy-search-operation">
          <button type="button" class="el-button el-button--primary"><!---->
            <i class="el-icon-circle-plus-outline"></i>
            <span>New</span>
          </button><!----><!---->
        </span>
      </div>
    </div>
  </main>
</template>


<script>
export default {
  name: "linshi"
}
</script>

<style scoped>

</style>